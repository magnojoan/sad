Asis::Application.routes.draw do

  devise_for :users
  resources :products
  root to: "pages#index"

end
