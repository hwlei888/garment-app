Rails.application.routes.draw do

  root to: 'pages#home'

  # Login/logout (session) routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/garments/:id/like' => 'garments#like', as: 'like_garment'

  resources :garments, :brands, :occasions, :collocations, :users, :comments
  

end
