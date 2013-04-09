Asis::Application.routes.draw do

  devise_for :users
  resources :products
  resources :adjustments

  match "/products/:id", :to => "products#disable"

  root to: "pages#index"

end
