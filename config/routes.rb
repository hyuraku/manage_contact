Rails.application.routes.draw do
  resources :contacts,except: [:show] do
    get 'autocomplete',on: :collection
  end

  resources :groups, only: [:create]
  root 'contacts#index'
end
