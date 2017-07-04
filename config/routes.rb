Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/login'

  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  post 'sessions/login_attempt'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'users/new'

  root :to => 'statics#home'

  resources :users
end
