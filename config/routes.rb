Asis::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)
  resources :products
  resources :adjustments
  resources :customers

  match "/products/:id", :to => "products#disable"

  root to: "pages#index"

end
