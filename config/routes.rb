Rails.application.routes.draw do

  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  get 'users/mypage', to: 'users#mypage'
  post 'users/mypage', to: 'users#mypage_edit_update'
  get 'users/mypage_edit', to: 'users#mypage_edit'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  get 'comments/new', to: 'comments#new'
  post '/comments', to: 'comments#create'

  get 'topics/usertopics', to: 'topics#usertopics'
  get 'topics/detail', to: 'topics#detail'
  get 'topics/edit', to: 'topics#edit'
  get 'topics/prefectures', to: 'topics#prefectures'

  resources :users
  resources :topics


  resources :topics do
    resources :comments
  end

  get 'users/users/area', to: 'users#area'
end
