Rails.application.routes.draw do
  root to: "pages#landing"
  get '/user/show', to: 'users#show'
  devise_for :users
  get '/404' => 'errors#not_found'
  get '/500' => 'errors#server_error'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :trips
  resources :trip_activities, only: [:update]
end
