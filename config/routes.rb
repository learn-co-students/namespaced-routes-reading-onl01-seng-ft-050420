Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
 
  #WET
#  get '/admin/stats', to: 'stats#index'
  #LESS WET
  # scope '/admin', module: 'admin' do 
  #   resources :stats, only: %i[index]
  # end 
  #DRY 
    namespace :admin do 
      resources :stats, only: %i[index]
    end 
  root 'posts#index'
end
