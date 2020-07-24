Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #scope '/admin', module: 'admin' do #we're telling scope that we want to use /admin as a URL prefix
  #  resources :stats, only: [:index] #letting rails know that all of our included routes are going to be handled by controlers in the admin module
  #end
  #anytime you want to route with a module and use that module's name as a URL prefix then use namespace
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end

#summary - 1)learned you can use scope to group all URLS by using an admin prefix
#2) how to organize our controllers using directories and modules
#3) how to use namespace to replace our scope, module
