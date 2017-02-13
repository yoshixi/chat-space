Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'chat_groups#index'
  get '/chat_groups/new' , 'chat_groups#new'
  get '/chat_groups/:id/edit' , 'chat_groups#edit'
end
