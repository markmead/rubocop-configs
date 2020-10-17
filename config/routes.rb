Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  resources :posts do
    member do
      put "like"
    end
  end

  resources :tags

  get "/likes", to: "user_likes#index"
  get "/my-cops", to: "user_posts#index", as: "user_posts"
end
