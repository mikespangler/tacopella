Tacopella::Application.routes.draw do
  resources :songs
  resources :challenges

   root 'challenges#welcome'
  get 'challenges/:id/songs/song_results' => 'songs#song_results', :as => :song_results 
  post 'songs/song_results' => 'challenges#update'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
   post 'challenges/add_songs' => 'challenges#add_songs', :as => :add_songs
  # You can have the root of your site routed with "root"
   get 'challenges/:id/show' => 'challenges#show' , :as => :show_challenge
   get 'challenges/:id/songs/search' => 'songs#search_songs', :as => :search_songs

   #post 'challenges/:id/songs/search' => 'songs#create_search_results'

   #post 'challenges/:id/songs/song_results' => 'songs#song_results', :as => :song_results 
   post 'challenges/:id/updates' => 'challenges#update', :as => :update_challenge
   get 'challenges/:id/songs/:song_count' => 'challenges#get_next_song', :as => :get_next_song

   #post 'challenges/:id/songs/search' => 'songs#create_search_results'

  get 'challenges/:id/yer_done' => 'challenges#yer_done', :as => :yer_done

  get 'challenges/:id/invite-friends' => 'challenges#invite_friends_form', :as => :invite_friends
  post 'challenges/invite-friends' => 'challenges#invite_friends'

  # post 'challenges/add_songs' => 'challenges#add_songs', :as => :add_songs

  # get 'challenges/:id/songs/search' => 'songs#search_songs', :as => :search_songs

  # #post 'challenges/:id/songs/search' => 'songs#create_search_results'
  # get 'challenges/:id/songs/song_results' => 'songs#song_results', :as => :song_results 
  # post 'songs/song_results' => 'challenges#update'
   
  # get 'challenges/:id/songs/song_results/show' => 'song'


   # match "/auth/:provider/callback" => "sessions#create", via: [:get,:post]
   # match "/signout" => "sessions#destroy", :as => :signout, via: [:get,:post]

  # match "/auth/:provider/callback" => "sessions#create", via: [:get,:post]
  # match "/signout" => "sessions#destroy", :as => :signout, via: [:get,:post]

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
