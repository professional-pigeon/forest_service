Rails.application.routes.draw do
  root to: 'animals#index'
  resources :animals do
  end
end