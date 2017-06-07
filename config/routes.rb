Rails.application.routes.draw do
  resources :gifts
  resources :guests
  resources :rsvps
  root 'pages#home'

  get 'rsvp', to: 'rsvps#new'

  get 'visa' => 'pages#visa'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
