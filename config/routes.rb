Rails.application.routes.draw do
  resources :contacts,except: [:show] do
    get 'autocomplete',on: :collection
  end
  root 'contacts#index'
end
