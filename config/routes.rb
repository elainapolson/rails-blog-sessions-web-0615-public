RailsBlog::Application.routes.draw do
  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments
  end

  get '/signup', to: 'users#new'
  
  root 'posts#index'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



end
