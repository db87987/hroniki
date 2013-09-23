Hroniki::Application.routes.draw do
  
  resources :hroniks
  match '/hroniks/comment' => 'hroniks#comment', :via => :post

  resources :articles
  match '/articles/comment' => 'articles#comment', :via => :post
  
  match '/olds/issue' => 'olds#issue', :via => :get, :as => :issue
  resources :olds
  match '/olds/comment' => 'olds#comment', :via => :post
  
  mount Ckeditor::Engine => '/ckeditor'
  
  match '/feedbacks' => 'feedbacks#create', :via => :post, :as => :feedbacks
  match '/feedback' => 'static_pages#feedback'
  match '/calendar' => 'static_pages#calendar'
  
  root :to => 'static_pages#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
