Hroniki::Application.routes.draw do
  resources :suggests
  resources :hroniks
  match '/hroniks/comment' => 'hroniks#comment', :via => :post

  resources :articles
  match '/articles/comment' => 'articles#comment', :via => :post
  
  match '/olds/issues' => 'olds#issues', :via => :get, :as => :issues
  resources :olds
  match '/olds/comment' => 'olds#comment', :via => :post
  
  mount Ckeditor::Engine => '/ckeditor'
  
  match '/feedbacks' => 'feedbacks#create', :via => :post, :as => :feedbacks
  match '/feedback' => 'static_pages#feedback'
  match '/calendar' => 'events#index'
  match '/events/comment' => 'events#comment', :via => :post
  match '/events' => 'events#create', :via => :post, :as => :events
  match '/events/:id' => 'events#show', :as => :event
  match '/tags' => 'static_pages#tags'
  
  root :to => 'static_pages#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
