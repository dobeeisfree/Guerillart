Rails.application.routes.draw do
  root 'home#index'
  resources :follows, only: [:create, :destroy]

  get '/dashboard' => redirect('/dashboard/home')
  get '/dashboard/home' => 'dashboard#home'
  get '/dashboard/guerillart' => 'dashboard#guerillart'
  get '/dashboard/profile' => 'dashboard#profile'

  get '/shows/:show_id/like' => 'likes#like_toggle'
  resources :shows

  resources :artists, only: [:index, :new], param: :name   #매개변수를 기존의 artist_id에서 artist_name으로 변경  
  get '/artists/:artist_name' => 'artists#page'
  get '/artists/:artist_name/edit' => 'artists#edit'
  put '/artists/:artist_name' => 'artists#update'
 
  resources :posts, only: [:create, :destroy, :update]
  resources :comments, only: [:create, :destroy]

  get '/search' => 'searching#index'
  post '/search' => 'searching#getBounds'
  post '/search/select' => 'searching#select'

  get '/login' => redirect('/')
  get '/register/new' => redirect('/')
  get '/register/edit' => redirect('/')
  get '/forgot/new' => redirect('/')

  devise_for :users, :path => '', :controllers => {:sessions => 'users/sessions', :registrations => 'users/registrations'}, :path_names => { :sign_in => 'login', :password => 'forgot', :confirmation => 'confirm', :unlock => 'unblock', :registration => 'register', :sign_up => 'new', :sign_out => 'logout'}

  # devise_for :users, :skip => [:sessions]
  # as :user do
    # get '/users/sign_in' => 'devise/sessions#new', :as => :new_user_session
    # post '/users/sign_in' => 'devise/sessions#create', :as => :user_session
    # delete '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end




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

  match '*path' => redirect('/'), via: [:get]
end
