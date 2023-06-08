Rails.application.routes.draw do
  root to: "pages#landing"
  devise_for :users
  get '/404' => 'errors#not_found'
  get '/500' => 'errors#server_error'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips
end
