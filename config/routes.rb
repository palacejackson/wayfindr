Rails.application.routes.draw do
  root to: "pages#landing"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips
end
