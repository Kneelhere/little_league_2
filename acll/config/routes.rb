Rails.application.routes.draw do
  get 'sessions/new' => 'sessions#new'

  get 'sessions/create' => 'sessions#create'

  get 'sessions/destroy' => 'sessions#destroy'

  get '/' => 'welcome#index'

  resources :leagues

  resources :teams

  resources :users do
  	resources :kids
  end
end
