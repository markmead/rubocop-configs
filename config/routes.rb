Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"

  resources :posts do
    member do
      put "like"
    end
  end

  resources :tags

  scope module: :user do
    get "/likes", to: "likes#index", as: "user_likes"
    get "/my-cops", to: "posts#index", as: "user_posts"
  end
end
