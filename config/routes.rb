Rails.application.routes.draw do
  root 'flights#index'
  resources :bookings, only: %i[new create show]
end
