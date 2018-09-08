Rails.application.routes.draw do
  get 'dashbord/index'

  devise_for :users
  resources :contacts,except: [:show] do
    get 'autocomplete',on: :collection
  end

  resources :groups, only: [:create]
  get '/dashboard' => "dashboard#index"
  root 'contacts#index'
end
