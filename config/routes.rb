Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :photos, only: %i[index show new create]

  namespace :oauth do
    post 'my_tweet_app' => 'my_tweet_app#create'
    get 'callback' => 'my_tweet_app#callback'
  end
end
