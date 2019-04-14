Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'category#index', as: 'home'
  resources :category
  resources :product do
    post 'add_to_cart'
  end

  resources :order

  post '/order/check_coupon' => 'order#check_coupon'
end
