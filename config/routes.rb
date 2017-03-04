Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'groups#index'
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
