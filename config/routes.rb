Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'chat_groups#index'
  resources :chat_groups, except: [:show, :destroy]
end
