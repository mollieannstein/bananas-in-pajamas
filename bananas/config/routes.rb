Rails.application.routes.draw do

#need to clean up routes -- trim routes

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => "users#new"
  post '/users/' => "users#create"

  get '/' => "main#index"

  resources :categories do
    resources :articles
  end

end
