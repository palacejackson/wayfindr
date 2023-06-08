Rails.application.routes.draw do
  root to: "pages#landing"
  get 'users/show'
  get 'trips/show'
  get 'trips/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips
end
