Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/google_oauth2', as: :google_login
  get '/logout', to: 'sessions#destroy', as: :google_logout

  get '/', to: 'welcome#index', as: :root

  get '/flights', to: 'flights#index'
  get '/flights/:id', to: 'flights#show', as: :flight_show
end
