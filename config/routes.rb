Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:index, :create]
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/locations/most_popular' => 'locations#popular'
  resources :calendars, param: :name do
    resources :events
  end
  resources :locations, only: [:index, :show]
end
