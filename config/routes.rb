Gifmark::Application.routes.draw do
  resources :gifs
  root :to => 'gifs#index'

end
