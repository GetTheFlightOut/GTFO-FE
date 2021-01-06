Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/google_oauth2', as: :google_login

  get '/', to: 'welcome#index', as: :root
end
