<<<<<<< HEAD
ActionController::Routing::Routes.draw do |map|
 # map.resources :comments
  #map.resources :shares

    map.resources :users do |user|
    
    user.resources :items do |item|
      item.resources :offers
      item.resources :comments
      item.resources :shares
    end
     end
  # user.resources :items do |item|
 #     item.resources :offers
  #    item.resources :shares
  #    end  

 

=======
ActionController::Routing::Routes.draw do |map|  

  map.resources :users do |user|
  user.resources :recent_activities
  user.resources :items do |item|
               item.resources :offers
                end
  user.resources :offers do|offer|
    offer.resources :thumbsups
    offer.resources :thumbsdowns
    
  end
  
  end
  
>>>>>>> 4a05d63c85b9f97105a852b07f9b3e83bd51c156
  map.resource :user_session
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  
  # This route can be invoked with purchase_url(:id => product.id)
<<<<<<< HEAD
 map.reject_offer 'reject_offer/:id', :controller=> "offers", :action => "reject_offer"
    map.revoke_offer 'revoke_offer/:id', :controller => "offers", :action => "revoke_offer"
    map.item_id 'items/:id/myItemList', :controller => 'items', :action => 'item_id'
    map.login "login", :controller => "user_sessions", :action => "new"
    map.logout "logout", :controller => "user_sessions", :action => "destroy"
    map.validate_offer_by_status "validate_offer_by_status" , :controller=> "users", :action=> "validate_offer_by_status"
=======
map.reject_offer 'rejectoffer/:id', :controller=> "offers", :action => "reject_offer"
map.revoke_offer 'offer/:id', :controller => "offers", :action => "revoke_offer"
map.item_id 'items/:id/myItemList', :controller => 'items', :action => 'item_id'
map.login "login", :controller => "user_sessions", :action => "new"
map.logout "logout", :controller => "user_sessions", :action => "destroy"
map.validate_offer_by_status "validate_offer_by_status" , :controller=> "users", :action=> "validate_offer_by_status"
>>>>>>> 4a05d63c85b9f97105a852b07f9b3e83bd51c156

    # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
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
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
