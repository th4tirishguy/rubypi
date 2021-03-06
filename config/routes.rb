Rails.application.routes.draw do

  root 'static_page#home'

  #routes for the blog and posts
  get 'blog/new_post' => 'post#new'

  post 'new_post' => 'post#create', :as => 'new_post'

  get 'blog/:slug' => 'post#show', :as => 'post'

  
  #static pages
  get '/project' => 'static_page#project'

  get '/hardware' => 'static_page#hardware'

  get '/contact' => 'static_page#contact'


  #routes for signup. Commented out to prevent random people creating accounts
  # get '/signup' => 'user#new'

  # post '/signup' => 'user#create', :as => 'sign_up'

  #routes for sessions
  get '/login' => 'session#new'

  post '/login' => 'session#create', :as => 'log_in'

  get '/logout' => 'session#destroy', :as => 'log_out'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
