Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/login'

  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  post 'sessions/login_attempt'

  get 'users/new'

  get 'users/services'

  get 'statics/terms'

  put 'users/update_services'

  root :to => 'statics#home'

  resources :users

  resources :chat_rooms, only: [:new, :create, :show, :index]
  
  mount ActionCable.server => '/cable'
end
