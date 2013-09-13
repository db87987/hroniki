Hroniki::Application.routes.draw do
  
  resources :articles
  match '/articles/comment' => 'articles#comment', :via => :post

  mount Ckeditor::Engine => '/ckeditor'

  resources :hroniks
  match '/hroniks/comment' => 'hroniks#comment', :via => :post

  match '/contacts' => 'static_pages#contacts'
  
  root :to => 'static_pages#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
