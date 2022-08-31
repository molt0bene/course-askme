Rails.application.routes.draw do
  get 'users/create'
  get 'users/new'
  root to: 'questions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions
  put '/questions/:id/hide', to: 'questions#hide'

  resources :users, only: %i[new create]
end
