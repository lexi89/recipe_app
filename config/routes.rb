Rails.application.routes.draw do
  get "/" => "pages#home", as: :root
  
  resources :recipes do
    member do
      post 'like'
    end
  end
  
    
end
