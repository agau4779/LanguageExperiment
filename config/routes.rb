LanguageExperiment::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :iterative_chains do
    get 'training', on: :member
    get 'testing', on: :member
    put 'finish', on: :member
  end

  resources :sessions, only: [:new, :create, :destroy]

  match '/start',  to: 'sessions#new',         via: 'get'
  match '/finish', to: 'sessions#destroy',     via: 'delete'
end
