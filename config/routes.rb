Rails.application.routes.draw do

  root 'stories#index', as: "short_stories"
  devise_for :writers
  resources :writers, only: [:index, :show]
  resources :categories, only: [:new, :index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :stories do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
