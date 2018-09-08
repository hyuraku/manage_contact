Rails.application.routes.draw do

  devise_for :users, path: 'auth', controllers: {registerations: :custom_registrations } ,path_names: { sign_in: 'login', sign_out: 'logout',sign_up: 'register' }
  resources :contacts,except: [:show] do
    get 'autocomplete',on: :collection
  end

  resources :groups, only: [:create]
  get 'dashboard/index'
  get '/dashboard' => "dashboard#index"
  root 'home#index'
end
