Rails.application.routes.draw do
  get 'sessions/new' => 'sessions#new'

  post 'sessions/create' => 'sessions#create'

  delete '/sessions' => 'sessions#destroy'

  get '/' => 'welcome#index'

  resources :leagues do 
  	resources :teams
  end

  resources :users do
  	resources :kids
  end
end
