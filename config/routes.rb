Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "posts#index"

  resources :posts do
    member do
      put "like"
    end
  end

  resources :tags

  get "/references", to: "pages#references"
  get "/leaderboard", to: "leaderboard#index"

  scope module: :user do
    get "/likes", to: "likes#index", as: "user_likes"
    get "/my-cops", to: "posts#index", as: "user_posts"
  end

  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"
end
