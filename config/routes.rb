Rails.application.routes.draw do
  get 'users/create'
  get 'users/new'
  root to: 'questions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
    put 'hide', on: :member
  end

  resources :users, only: %i[new create]
end
