Rails.application.routes.draw do

  root to: 'pages#home'

  # Login/logout (session) routes
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :garments, :brands, :occasions, :collocations, :users, :comments
  
  get '/garments/:id' => 'comments#new' 
  #???? when at path /garments/:id, run def new in comments controller????

  post '/garments/:id' => 'comments#create' 
  #???? how decide post url ??????

end
