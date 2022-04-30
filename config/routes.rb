Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/users" => "users#index" # show all users
  get "/users/:username" => "users#show" # show user
  post "/users" => "users#create" # make new user
  patch "/users/:username" => "users#update" # update user
  delete "/users/:id" => "users#destroy" # destroy 

  get "/alliances" => "alliances#index" # show all alliances
  get "/alliances/:name" => "alliances#show" # show alliance
  post "/alliances" => "alliances#create" # make new alliance
  patch "/alliances/:id" => "alliances#update" # update alliance
  delete "/alliances/:id" => "alliances#destroy" # destroy
  
  post "/alliances/:name/join" => "alliances#join_alliance" # join alliance
  delete "/alliances/:name/leave" => "alliances#leave_alliance" # leave alliance

  post "/sessions" => "sessions#create"
end
