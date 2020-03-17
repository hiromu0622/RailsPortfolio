Rails.application.routes.draw do

  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  get 'users/mypage', to: 'users#mypage'
  get 'users/mypage_edit', to: 'users#mypage_edit'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  resources :users
  resources :topics

end
