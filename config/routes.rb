Rails.application.routes.draw do

  resources :questions

  resources :advertisements

  resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts
   end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
