LanguageExperiment::Application.routes.draw do
  resources :iterative_chains do
    resources :user_entries, only: [:index, :show]
  end

  resources :pairs
end
