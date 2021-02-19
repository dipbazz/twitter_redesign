Rails.application.routes.draw do
  # root 'Opinions#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :opinions, only: [:index]
end
