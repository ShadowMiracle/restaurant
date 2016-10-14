Rails.application.routes.draw do
  resources :comments
  patch 'order/update'
  get 'cart/show'

  resources :order_items
  resources :food_items

  root 'home#index'

  get 'menu' => 'home#menu'
  get 'contact_us' => 'home#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
