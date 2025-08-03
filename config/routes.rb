Rails.application.routes.draw do
  get "article_tags/create"
  get "articles/index"
  get "articles/create"
  get "articles/destroy"
  get "news/search"
  # root "pages#home"
  devise_for :users

  root "news#search"
  get "search", to: "news#search"

  resources :articles, only: [ :index, :create, :destroy ] do
    resource :tags, only: [ :create ], controller: "article_tags"
  end
end
