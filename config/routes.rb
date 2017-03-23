Rails.application.routes.draw do
  get "/" => "products#index"

  get "/boots" => "products#index"
  get "/boots/new" => "products#new"
  post "/boots" => "products#create"
  get "/boots/:id" => "products#show"
  get "/boots/:id/edit" => "products#edit"
  patch "/boots/:id" => "products#update"
  delete "/boots/:id" => "products#destroy"

  get "/random_boot" => "products#random"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
