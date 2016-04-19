Rails.application.routes.draw do


#need to clean up routes -- trim routes
  resources :articles, only: [:index]

  resources :categories do
    resources :articles
  end
  # get '/categories/:id/articles' => 'categories#show', as: 'category_articles'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => "users#new"
  post '/users/' => "users#create"

  root "main#index"

end
