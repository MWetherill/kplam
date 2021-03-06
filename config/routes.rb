Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "pages/index"
  get 'custom_action',to: 'pages#custom_action'
  resources :projects do
    resources :tasks, shallow: true
  end
  resources :events
  resources :posts do
    resources :comments, shallow: true do
      patch 'recover'
    end
  end
  resources :languages
end
