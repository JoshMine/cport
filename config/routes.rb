Cport::Application.routes.draw do

  devise_for :users, :controllers => {#:registrations => "users",
                                      :omniauth_callbacks => "users/omniauth_callbacks"}

  scope "(:locale)", :locale => /ru|en/ do

    match '/:locale' => 'static_pages#home'

    root :to => 'static_pages#home'

    #match '/signup',  to: 'users#new'
    ##match '/profile', to: 'users#show'
    ##match '/settings', to: 'users#edit'
    #match '/signin',  to: 'sessions#new'
    #match '/signout', to: 'sessions#destroy', via: :delete

    as :user do
      get 'signin', to: 'devise/sessions#new'
      get 'signup', to: 'registrations#new'
      get 'signout', to: 'devise/sessions#destroy'
    end

    match '/home', to: 'static_pages#home'
    match '/help', to: 'static_pages#help'
    match '/about', to: 'static_pages#about'
    match '/contacts', to: 'static_pages#contacts'

    match '/portfolio', to: 'portfolios#show'
    match '/portfolio/create', to: 'portfolios#new'
    match '/portfolio/addparticipant', to: 'portfolios#addparticipant'

    match '/participant/documents', to: 'participants#documents'
    match '/participant/property', to: 'participants#property'
    match '/participant/incoming', to: 'participants#incoming'
    match '/participant/costs', to: 'participants#costs'


    resources :users
    #resources :sessions, only: [:new, :create, :destroy]
    resources :portfolios, only: [:new, :show, :create, :addparticipant] # do #, only: [:new, :show, :create, :addparticipant, :destroy]
    resources :participants #, only: [:new, :create, :show, :edit, :update, :destroy, :documents]# do
    resources :passports
    resources :drive_licenses
    resources :pension_certificates
    resources :tin_certificates
    resources :oversea_passports
    resources :flats
    resources :cars
    resources :main_jobs
    # end
    # end


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
  end
end
