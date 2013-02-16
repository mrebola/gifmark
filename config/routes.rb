Gifmark::Application.routes.draw do
  get "/tag/:tag", to: 'gifs#index', as: :tag
  resources :gifs
  root :to => 'gifs#index'

end
