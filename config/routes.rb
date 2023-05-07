Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/account'

  get '/users/profile'

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :reservations

  resources :users
end
