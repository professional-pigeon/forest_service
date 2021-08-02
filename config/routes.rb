Rails.application.routes.draw do
  root to: 'animals#index'
  resources :animals, :regions do
    resources :sightings
  end
end