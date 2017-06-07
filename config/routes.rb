Rails.application.routes.draw do
  resources :guests
  resources :rsvps
  root 'pages#home'

  get 'rsvp', to: 'rsvps#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
