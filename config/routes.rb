Stck::Application.routes.draw do



#  get "change_password/update_password"

  resources :stck_requests
  post "stck_requests/search"
  #map.search "search", :controller => "stck_request"
  resources :perusahaans


#  devise_for :users, :skip => [:registrations]                                          
#    as :user do
#      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
#      put 'users' => 'devise/registrations#update', :as => 'user_registration'            
#  end
  devise_for :users

  get "user/index"
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end
  scope "/admin" do
    resources :users
  end

  root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/dashboard', to: 'static_pages#dashboard'

  match "/change_password" => "change_password#edit"
  put "change_password/update_password"


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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

# Any other routes are handled here (as ActionDispatch prevents RoutingError from hitting ApplicationController::rescue_action).
match "*path", :to => "application#routing_error"

end
