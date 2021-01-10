class ApplicationController < ActionController::Base
  helper_method :current_user, :not_found

  def current_user
    @current_user ||= User.find_by(uid: session[:uid]) if session[:uid]
  end

  def not_found
    render :file => './public/404.html', :status => 404
  end
end
