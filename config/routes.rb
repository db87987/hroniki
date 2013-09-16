Hroniki::Application.routes.draw do
  
  resources :articles
  match '/articles/comment' => 'articles#comment', :via => :post

  mount Ckeditor::Engine => '/ckeditor'

  resources :hroniks
  match '/hroniks/comment' => 'hroniks#comment', :via => :post

  match '/feedback' => 'static_pages#feedback'
  
  root :to => 'static_pages#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
