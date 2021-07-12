Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home/prices', to: 'home#prices'
  post '/home/prices', to: 'home#prices'
end
