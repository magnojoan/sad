Asis::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)
  resources :products
  resources :adjustments
  resources :customers

  match "/products/:id", :to => "products#disable"
  match "/orders/print/:id", :to => "reports#print", :as => :print
  match "/lots/print/:id", :to => "reports#print", :as => :print

end
