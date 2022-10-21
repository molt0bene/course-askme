Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    put :hide, on: :member
  end

  resources :hashtags, param: :value, only: %i[index show]

  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: [:index]
end
