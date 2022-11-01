Rails.application.routes.draw do
  devise_for :users
  scope '/Admin' do
    resources :users
    resources :roles
    resources :dealerships
    resources :cars
  end
  scope '/User' do
    resources :cars
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "cars#index"
end
