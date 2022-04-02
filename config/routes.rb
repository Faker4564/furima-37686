Rails.application.routes.draw do
  devise_for :users
  get 'fleamarkets/index'
  root to: "fleamarkets#index"
end
