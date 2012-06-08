SYMP::Application.routes.draw do 
  get "home/index"

  get "forum/index"

  resources :posts

  resources :topics

  resources :sections

  resources :searches

  resources :ratings

  resources :skills

  resources :user_sessions
  resources :users

  resources :home
  
  resources :forum

  get "login" => "user_sessions#new"
  get "logout" => "user_sessions#destroy"
  
  match 'logout', :to => 'user_sessions#destroy', :as => "logout"
 
  match 'forum', :to => 'forum#index', :as => "forum"

  # route for section->topic connection 
  # enables something like /section/1/topic and makes params[:section_id] available for the topics_controller
  resources :sections do
  	resources :topics do
  	end
  end

  # route for topic->post connection 
  # enables something like /topic/1/post and makes params[:topic_id] available for the posts_controller
  resources :topics do
  	resources :posts do
  	end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'home#index', :as => 'home'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
