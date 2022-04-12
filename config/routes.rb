Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:intex, :new, :create, :edit, :update, :show]
end
