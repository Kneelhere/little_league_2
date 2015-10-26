Rails.application.routes.draw do
  get 'sessions/new' => 'sessions#new'

  post 'sessions/create' => 'sessions#create'

  delete '/sessions' => 'sessions#destroy'

  get '/' => 'welcome#index'

  resources :leagues

  resources :teams

  resources :users do
  	resources :kids
  end
end
