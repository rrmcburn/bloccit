Rails.application.routes.draw do

  resources :questions

  resources :advertisements

  resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts
   end

   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
   end

   post '/up-vote' => 'votes#up_vote', as: :up_vote
   post '/down-vote' => 'votes#down_vote', as: :down_vote

   resources :users, only: [:new, :create]

   resources :sessions, only: [:new, :create, :destroy]


   post 'users/confirm' => 'users#confirm'

   get 'about' => 'welcome#about'

   root 'welcome#index'

end
