Rails.application.routes.draw do
  resources :posts do
  	resources :reviews
  end
  devise_for :users
  #get 'home/index'
  #root 'home#index'
  root to: 'posts#index'
  resources :users
  resources :reviews
  get '/myprofile' => 'users#myprofile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
