Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/secret'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :welcome, only: [:index]
  resources :events
 resources :users
  # Defines the root path route ("/")
  
end
