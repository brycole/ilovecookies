Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#index'

  resources :pages, only: %i[index]
  resources :categories, only: %i[index]

end
