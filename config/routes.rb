Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, only: %i[index show]
  resources :books
  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
