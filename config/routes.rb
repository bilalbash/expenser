Rails.application.routes.draw do
  resources :categories do
    resources :items
  end

  root to: 'visitors#index'
  devise_for :users
end
