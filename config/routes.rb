Rails.application.routes.draw do
  resources :messages, :only => [:index, :new, :create, :show]
  resources :contacts, :only => [:index, :new, :create]
  root 'messages#index'
end
