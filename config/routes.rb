Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  post "/restaurant_list" => "home#restaurant_list"
end
