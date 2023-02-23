Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/secret'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :events
 resources :users
  resources :welcome, only: [:index, :show]
  
  # Defines the root path route ("/")
  
end
