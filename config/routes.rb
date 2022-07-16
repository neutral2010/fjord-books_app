Rails.application.routes.draw do
  # resources :reports
  resources :comments, only: %i[show edit destroy]
  resources :reports do
    resources :comments,  module: :reports
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  # resources :books
  resources :books do
    resources :comments, module: :books
    # resources :comments, only: [:create], module: :books
  end

  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: %i[index]
      resources :followers, only: %i[index]
    end
  end
end

