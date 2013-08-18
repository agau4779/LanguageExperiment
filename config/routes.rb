LanguageExperiment::Application.routes.draw do

  root to: "iterative_chains#start"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :iterative_chains do
    put 'check', on: :collection
    get 'training', on: :member
    get 'testing', on: :member
    put 'finish', on: :member
  end

  resources :pairs
end
