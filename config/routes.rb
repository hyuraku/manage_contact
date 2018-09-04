Rails.application.routes.draw do
  devise_for :users
  resources :contacts,except: [:show] do
    get 'autocomplete',on: :collection
  end

  resources :groups, only: [:create]
  root 'contacts#index'
end
