Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
  	resources :users, :except => [:index]
  	get 'users', to: "users#index"
  	get 'typehead/:input', to: "users#typehead"
  end 
end
