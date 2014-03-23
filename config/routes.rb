Jamesgarage::Application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users
  match '/signup', to: 'users#new', via: :get

  get "users/new"
  get "pictures/show"

  match '/albums/edit', to: 'albums#edit_all', as: 'album_edit_all', via: 'get'
  match '/albums/:id/change_title', to: 'albums#change_title', as: 'change_album_title', via: 'get'
  resources :albums do
    resources :pictures
  end

  # match reverse, 'picture_delete_path(id)' and 'pictures#destroy' combine to make new path for
  # ':controller/:action/:id'
  match ':controller/:action/:id', to: 'pictures#destroy', as: 'picture_delete', via: 'delete'
  match ':controller/:action/:id', to: 'pictures#update_cover', as: 'picture_cover', via: 'put'
  
  get "cars_for_sale" => "albums#index"
  get "services" => "static_pages#services"
  get "contact" => "static_pages#contact"
  get "faq" => "static_pages#faq"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#services'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
