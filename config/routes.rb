Rails.application.routes.draw do
  get 'reviews/new'
  root to: "restaurants#index"
  resources :restaurants, only: [:index, :new, :create, :show] do 
    resources :reviews, only: [:create]
  end
end
