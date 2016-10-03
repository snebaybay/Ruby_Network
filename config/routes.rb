Rails.application.routes.draw do

  get '/professional_profile' => 'friendships#index'
  get '/friendships/ignore/:id' => 'friendships#ignore'
  get '/friendships/destroy/:user_id' => 'friendships#destroy'
  get '/friendships/create/:user_id' => 'friendships#create'
  get 'friendships/accept/:id/:user_id' => 'friendships#accept'
  get '/users' => 'users#index'
  post '/users/register' => 'users#register'
  post '/users/login'
  get '/users/show' => 'users#show_all'
  get "/users/:user_id" => "users#show"
  post '/users/logout' => 'users#logout' 

end
