Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#index'

  resources :categories, only: %i[show] do
    resources :product, only: %i[show]
  end

end
