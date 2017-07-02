Rails.application.routes.draw do

  resources :categories
  resources :items do
    resources :line_items
  end

  root to: 'visitors#index'
  devise_for :users
end
