DansTheMan::Application.routes.draw do
  devise_for :users
  root to: "guests#index"

  resources :guests
  resources :addresses
  resources :add_guests

  match "add_guests/guest",            to: "add_guests#create_guest", via: "post"
  match "add_guests/address",          to: "add_guests#create_address", via: "post"
  match "add_guests/additional_guest", to: "add_guests#create_additional_guest", via: "post"
end
