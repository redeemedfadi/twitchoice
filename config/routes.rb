ActionController::Routing::Routes.draw do |map|
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  #map.new_question 'questions/new/:id', :controller => 'questions', :action => 'new'
  #map.edit_question 'questions/edit/:id', :controller => 'questions', :action => 'edit'
  map.login 'login', :controller => "authenticate", :action => "login"
  map.logout 'logout', :controller => "authenticate", :action => "logout"
  map.authenticate '/authenticate', :controller => "authenticate", :action => "authorize"
  map.user '/user/:username', :controller => "questions", :action => "user_index"
  map.clear 'clear', :controller => "questions", :action => "clear"

  map.resources :questions
  map.resources :answers
  map.resources :votes
  map.resources :comments

  map.about_us "/about_us", :controller => "welcome", :action => "about_us"
  map.terms "/terms", :controller => "welcome", :action => "terms"

  map.new "/new", :controller => "questions", :action => "new"
  map.question "/:sid", :controller => "questions", :action => "show"
  map.post_question "/:sid/post", :controller => "questions", :action => "post"
  map.voters "/voters/:answer_id", :controller => "votes", :action => "voters"


  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "questions"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
