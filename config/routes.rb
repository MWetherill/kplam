Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users
  resources :users, only: [:show, :new, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "pages/index"
  resources :projects do
    resources :tasks, shallow: true
  end
  resources :events
  resources :posts
  resources :languages
end
