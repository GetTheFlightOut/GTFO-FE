class SessionsController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only.
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @user = User.find_or_create_by(user_params)
    session[:uid] = @user.uid
    session[:token] = request.env['omniauth.auth'][:credentials][:token]
    redirect_to '/', notice: "Welcome, #{@user.first_name}!"
  end

  def destroy
    session.clear
    redirect_to '/', notice: 'You are now logged out.'
  end

  protected

  def user_params
    auth_hash = request.env['omniauth.auth']
    { uid: auth_hash[:uid],
      email: auth_hash[:info][:email],
      first_name: auth_hash[:info][:first_name],
      last_name: auth_hash[:info][:last_name] }
  end
end
