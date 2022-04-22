Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'my_portfolio', to: 'pages#my_portfolio'
  get 'transaction', to: 'pages#transaction'
  get 'create_user', to: 'pages#create_user'
  get 'search_stock', to: 'stocks#search'
  get 'deposit', to: 'cash#deposit'
  get 'withdraw', to: 'cash#withdraw'
  resources :user_stocks, only:[:create, :destroy]
  resources :transaction_stock_buy, only:[:destroy]
  resources :transaction_stock_sell, only:[:destroy]
  resources :profiles 
  # get 'profiles/new', to: 'profiles#new', as: 'new_book'
  # get '/profiles/:id', to: 'profiles#show', as: 'user'

end
