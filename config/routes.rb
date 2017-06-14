Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    resources :posts
    resources :gifts
    resources :guests
    resources :rsvps

    devise_for :users

    root 'pages#home'

    get 'guestbook', to: 'posts#index'

    get 'rsvp', to: 'rsvps#new'

    get 'gift', to: 'gifts#new'

    get 'visa' => 'pages#visa'

    get 'location' => 'pages#location'

    resources :charges
  end
end
