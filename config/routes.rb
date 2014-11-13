Rails.application.routes.draw do
# resources :restaurants

root 'welcome_pages#start'

get 'restaurants/index', to: 'restaurants#index', as: :restaurants
get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant
post 'restaurants/index', to: 'restaurants#create', as: :create_restaurant
get 'restaurants/:location/edit', to: 'restaurants#edit', as: :edit_restaurant
patch 'restaurants/:location', to: 'restaurants#save', as: :save_restaurant
get 'restaurants/:location', to: 'restaurants#show', as: :restaurant

# add update and destroy
get 'menu/items', to: 'menu_items#index', as: :menu_items
post 'menu/items', to: 'menu_items#create', as: :create_menu_item
get 'menu/items/add', to: 'menu_items#new', as: :new_menu_item
get 'menu/items/:id/edit', to: "menu_items#edit", as: :edit_menu_item
get 'menu/:location/index', to: 'menu_items#show_location', as: :menu
patch 'menu/items/:id', to: 'menu_items#save', as: :save_item
get 'menu/items/:id', to: 'menu_items#show_one', as: :menu_item  #done

get 'login/new', to: 'session#new', as: :login
post 'login/create', to: 'session#create', as: :create_session
get 'logout', to: 'session#destroy', as: :logout
get 'users/index', to: 'users#index', as: :users
post 'users/index', to: 'users#create', as: :create_user
get 'users/new', to: 'users#new', as: :new_user
get 'users/:id/edit', to: 'users#edit', as: :edit_user
get 'users/:id', to: 'users#show', as: :user
patch 'users/:id', to: 'users#save', as: :save_user

post 'order/add', to: 'orders#add', as: :add_to_order
get 'order', to: 'orders#view', as: :view_order
post 'order', to: 'orders#submit', as: :submit_order
get 'order/complete', to: 'orders#complete', as: :complete_order

get 'start', to: 'welcome_pages#start', as: :start


end
