Rails.application.routes.draw do
  root 'home#index'
  
  resources :follows, only: [:create, :destroy]
  
  get '/dashboard' => redirect('/dashboard/home')
  get '/dashboard/home' => 'dashboard#home'
  get '/dashboard/guerillart' => 'dashboard#guerillart'
  get '/dashboard/profile' => 'dashboard#profile'
  
  get '/dashboard/:show_id/like' => 'likes#like_toggle'
  
  
  get '/shows' => 'shows#index'
  get '/shows/new' => 'shows#new'
  post '/shows' => 'shows#create'
  get '/shows/:show_id/edit' => 'shows#edit'
  get '/shows/:show_id' => 'shows#view'
  put '/shows/:show_id' => 'shows#update'
  delete 'shows/:show_id' => 'shows#destroy'
  
  # get '/shows/:show_id/start' => 'shows#start'
  post '/shows/start' => 'shows#start'
  post '/shows/finish' => 'shows#finish' 
  
  get '/shows/:show_id/like' => 'likes#like_toggle'
  
  
  get '/artists' => 'artists#index'
  get '/artists/new' => 'artists#new'
  post '/artists' => 'artists#create'  
  get '/artists/search' => 'artists#search'
  get '/artists/:artist_name' => 'artists#page'
  get '/artists/:artist_name/edit' => 'artists#edit'
  put '/artists/:artist_name' => 'artists#update'
  
  
  
  post '/dashboard/write_post' => 'dashboard#write_post'
  
  
  
  
  
  resources :comments, only: [:create, :destroy]
  post '/comments/create' => 'comments#create'
  
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

  


  # get 'mypage' => 'dashboard#mypage'
  
  
  
  

  # get '/dashboard/mypage/:post_id' => 'dashboard#mypage'

  

  # get '/mypage_edit' => 'dashboard#mypage_edit'
  # post '/mypage_edit_complete' => 'dashboard#mypage_edit_complete'
  
  # get '/shows/view/:show_id' => 'home#view'


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
