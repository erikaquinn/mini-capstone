Rails.application.routes.draw do
  get "/all_boots" => "products#all_boots_method"
end
