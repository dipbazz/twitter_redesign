Rails.application.routes.draw do
  root 'opinions#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :opinions, only: [:index, :create, :new, :show] do
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    post 'follow', on: :member
    post 'unfollow', on: :member

    match 'follower' => 'followings#follower', :via => :get
    match 'following' => 'followings#following', :via => :get
  end
end
