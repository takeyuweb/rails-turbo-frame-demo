Rails.application.routes.draw do
  resources :tasks do
    resources :children, module: :tasks, only: %i[index]
  end
  root "tasks#index"
end
