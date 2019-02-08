Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]


  post '/heroines/new', to: 'heroines#create'
  get '/search', to: "heroines#index"
end
