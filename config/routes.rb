Asis::Application.routes.draw do

  devise_for :users
  resources :products

  match "/products/:id", :to => "products#disable"

  root to: "pages#index"

end
