Rails.application.routes.draw do
  resources :bike_points
  root "bike_points#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
