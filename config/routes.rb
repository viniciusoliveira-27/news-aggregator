Rails.application.routes.draw do
  get "articles/index"
  get "articles/create"
  get "articles/destroy"
  get "news/search"
  # root "pages#home"
  devise_for :users

  root "news#search"
  get "search", to: "news#search"

  resources :articles, only: [ :index, :create, :destroy ]
end
