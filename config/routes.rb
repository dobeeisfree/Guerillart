Rails.application.routes.draw do
  # devise_for :users
  root 'home#index'
  get 'home/index' => 'home#index'
  get 'home/shows' =>'home#shows'
  get 'home/artists' => 'home#artists'

  get 'dashboard/home' => 'dashboard#home'
  get 'dashboard/guerillart' => 'dashboard#guerillart'
  get 'dashboard/profile' => 'dashboard#profile'
  get 'dashboard/mypage' => 'dashboard#mypage'
  get 'dashboard/create_artist' => 'dashboard#create_artist'
  get 'dashboard/write' => 'dashboard#write'
  post 'dashboard/write_complete' => 'dashboard#write_complete'
  post 'dashboard/create' => 'dashboard#create'
  post 'dashboard/write_post' => 'dashboard#write_post'
  get '/dashboard/create' => 'dashboard#create'

  post 'dashboard/create' => 'dashboard#create'

  post 'write_complete' => 'dashboard#write_complete'
  get 'edit/:show_id' => 'dashboard#edit'
  post '/edit_complete/:show_id'=> 'dashboard#edit_complete'
  get '/delete_complete/:show_id' => 'dashboard#delete_complete'
  get 'searching/index'

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_for :users

  devise_for :users, :skip => [:sessions]
  as :user do
    get '/users/sign_in' => 'devise/sessions#new', :as => :new_user_session
    post '/users/sign_in' => 'devise/sessions#create', :as => :user_session
    delete '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
    # post '/dashboard/profile' => 'devise/registration#update' 
  end

  get "/search" => 'searching#index'
  get 'mypage' => 'dashboard#mypage'
  get 'shows' =>'home#shows'
  get 'artists' => 'home#artists'
  get 'dashboard/:show_id/like' => 'likes#like_toggle'
  get 'shows/:show_id/like' => 'likes#like_toggle'
  resources :comments, only: [:create, :destroy]
  post '/comments/create' => 'comments#create'
  
  get '/mypage/:post_id' => 'dashboard#mypage'
  
  post '/search' => 'searching#getBounds'
  # post '/searching/getBounds' => 'searching#getBounds'
  # post '/searching/getBounds'
  # post '/searching/index' => 'searching#getBounds'
  # get '/searching/getBounds' => 'searching#index'


  get '/mypage/:user.artist_name' => 'home#mypage'
  get '/mypage/:user.artist_name' => 'dashboard#mypage'
  get '/mypage_edit' => 'dashboard#mypage_edit'
  post 'mypage_edit_complete' => 'dashboard#mypage_edit_complete'
  resources :follows, only: [:create, :destroy]
  get '/shows/view/:show_id' => 'home#view'

 

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
