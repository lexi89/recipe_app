Rails.application.routes.draw do
  get "/" => "pages#home", as: :root
  resources :recipes
end
