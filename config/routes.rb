Yue::Application.routes.draw do
  resources :app_statuses

  resources :templates

  resources :designers

  resources :in_app_types

  resources :photos

  resources :albums

  get "images/index"
  get "images/new"
  get "images/show"
  post "images/create"
  resources :posts

  devise_for :users

  root :to => "designers#index"
  

  match '/avatar', to: 'home#avatar', via: 'get'
  match '/avatar', to: 'home#create', via: 'post'

  resources :posts do
    resources :comments
  end

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'


  

  namespace :api do
    namespace :v1 do
      devise_scope :user do

        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
        
        get "albums" => "album#index"
        post "albums" => "album#index"


        get 'post' => 'post#index', :as => 'post'
        post  'posts' => 'post#index', :as => 'posts'

        get "info" => 'post#info', :as=> 'info'

        post "upload" => 'post#upload', :as => 'upload'


        
        get "test" => 'test#index', :as => 'test'
        post 'test' => 'test#test'
        

      end

      get 'tasks' => 'tasks#index', :as => 'tasks'
      post 'tasks' => 'tasks#create'
      put 'tasks/:id/open' => 'tasks#open', :as => 'open_task'
      put 'tasks/:id/complete' => 'tasks#complete', :as => 'complete_task'
    end
  end
  
  
  
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
