Rails.application.routes.draw do
  get 'users/show'
  get 'trips/show'
  get 'trips/new'
  devise_for :users
  get '/404' => 'errors#not_found'
  get '/500' => 'errors#server_error'
  root to: "pages#landing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips
end
