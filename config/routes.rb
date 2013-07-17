LanguageExperiment::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :iterative_chains do
    resources :user_entries, only: [:index, :show]
  end

  resources :pairs
end
