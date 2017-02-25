Rails.application.routes.draw do
  resources :trips
  root :to => "trips#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
