Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'sessions#new'
  resources :sessions, only: %i[create]
  delete 'logout' => 'sessions#destroy'
  resources :photos, only: %i[index new create]
end
