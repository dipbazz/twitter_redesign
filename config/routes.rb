Rails.application.routes.draw do
  root 'opinions#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :opinions, only: [:index, :create, :new]
  resources :users, only: [:show] do
    post 'follow', on: :member
    post 'unfollow', on: :member
  end
end
