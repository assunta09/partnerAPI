Rails.application.routes.draw do
  resources :organisations, only: [:index, :show]
end
