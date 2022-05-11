Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/users" => "users#index" # show all users
  get "/users/:username" => "users#show" # show user
  post "/users" => "users#create" # make new user
  patch "/users/:username" => "users#update" # update user
  delete "/users/:id" => "users#destroy" # destroy 

  get "/alliances" => "alliances#index" # show all alliances
  get "/alliances/:name" => "alliances#show" # show alliance
  post "/alliances" => "alliances#create" # make new alliance
  patch "/alliances/:id" => "alliances#update" # update alliance
  delete "/alliances/:name" => "alliances#destroy" # destroy
  
  post "/alliances/:name/join" => "alliances#join_alliance" # join alliance
  delete "/alliances/:name/leave" => "alliances#leave_alliance" # leave alliance
  delete "/alliances/:name/kick/:username" => "alliances#kick_user" # kick user from alliance

  post "/sessions" => "sessions#create"

  get "/comics" => "comics#index" # show all comics
  get "/comics/:id" => "comics#show" # show comic

  get "/characters" => "characters#index" # show all characters
  get "/characters/:name" => "characters#show" # show character
end
