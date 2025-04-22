Rails.application.routes.draw do
  devise_for :customers
  root to: redirect('/homepage')
  get 'homepage', to: 'home#homepage'

  resources :restaurants, only: [:index, :show]
  resources :menu_items, only: [:show]
  resources :orders, only: [:create, :index, :show]
end
