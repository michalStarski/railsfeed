Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :subs, :posts
  resource :sessions, only: %i[new create destroy]

  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/posts/new/:sub', to: 'posts#new'
  post '/posts/reaction/:type', to: 'posts#reaction'

end
