Hroniki::Application.routes.draw do

  get "subscriptions/create"

  resources :suggests
  resources :hroniks
  match '/hroniks/comment' => 'hroniks#comment', :via => :post

  resources :articles
  match '/articles/comment' => 'articles#comment', :via => :post
  
  match '/olds/issues' => 'olds#issues', :via => :get, :as => :issues
  match '/issues/:id' => 'olds#issue', :as => :issue
  resources :olds
  match '/olds/comment' => 'olds#comment', :via => :post
  
  mount Ckeditor::Engine => '/ckeditor'
  
  match '/feedbacks' => 'feedbacks#create', :via => :post, :as => :feedbacks
  match '/subscriptions' => 'subscriptions#create', :via => :post, :as => :subscriptions
  match '/feedback' => 'static_pages#feedback'
  match '/calendar' => 'events#index'
  match '/events/comment' => 'events#comment', :via => :post
  match '/events' => 'events#create', :via => :post, :as => :events
  match '/events/:id' => 'events#show', :as => :event
  match '/tags' => 'static_pages#tags'
  match '/search_results' => 'search#results', :via => :get
  match '/search' => 'search#search', :via => :post
  
  
  match '/quiz/:id' => 'quizzes#quiz', :as => :quiz
  
  root :to => 'static_pages#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
