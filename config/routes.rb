Rails.application.routes.draw do
  get 'fleamarkets/index'
  root to: "fleamarkets#index"
end
