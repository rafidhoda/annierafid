Rails.application.routes.draw do
  resources :gifts
  resources :guests
  resources :rsvps
  root 'pages#home'

  get 'rsvp', to: 'rsvps#new'

  get 'gift', to: 'gifts#new'

  get 'visa' => 'pages#visa'

  get 'location' => 'pages#location'

  resources :charges
  # post 'charges/:gift', to: 'charges#gift'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
