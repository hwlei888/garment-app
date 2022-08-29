Rails.application.routes.draw do

  root to: 'pages#home'

  # Login/logout (session) routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :garments, :brands, :occasions, :collocations, :users

end
