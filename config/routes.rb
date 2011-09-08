Mis::Application.routes.draw do

  resources :categories do 
      resources :category_types
  end

  match '/configuration' => 'configuration#index'

   resources :network_managements do
      collection do
         get 'get_ip'
      end
   end

   resources :profile do
      collection do
         post :change_password
      end
   end
   resources :users 
   match '/dashboard' => 'dashboard#index'
   resources :tickets do
      resources :comments
      collection do
         get :filter
      end
   end
   resources :sessions
   match '/login' => 'sessions#new'
   match '/logout' => 'sessions#destroy'
   root :to => 'tickets#index'
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
   # root :to => "welcome#index"

   # See how all your routes lay out with "rake routes"

   # This is a legacy wild controller route that's not recommended for RESTful applications.
   # Note: This route will make all actions in every controller accessible via GET requests.
   # match ':controller(/:action(/:id(.:format)))'
end
