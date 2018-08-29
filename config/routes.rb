Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root("cats#index")
  #resources :cats, only: [:index, :create] do
  #  resources :favourites, only: [:index, :new]
  #end
  resources :favourites, only: [:index, :new, :create]
  resources :images, only: [:show]
end
