Rails.application.routes.draw do
  post 'create' => 'dashboard#create'
  get 'home' => 'dashboard#home'
  get 'guerillart' => 'dashboard#guerillart'
  get 'profle' => 'dashboard#profle'
  get 'create_artist' => 'dashboard#create_artist'
  get 'write' => 'dashboard#write'
  post 'write_complete' => 'dashboard#write_complete'
  get 'edit/:show_id' => 'dashboard#edit'
  post '/edit_complete/:show_id'=> 'dashboard#edit_complete'
  get '/delete_complete/:show_id' => 'dashboard#delete_complete'
  get 'searching/index'
  root 'home#index'
  devise_for :users
  get "/search" => 'searching#index'
  get 'mypage' => 'dashboard#mypage'
  get 'shows' =>'home#shows'
  get 'artists' => 'home#artists'

  # get '/hihi'
  # get '/hihi' => 'home#index'

  # get 'searching/index' => 'searching#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
