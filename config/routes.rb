Rails.application.routes.draw do
  resources :tasks, only: [:index, :create]

  if Rails.env.development?
    resources :screens, only: [:index, :show]
  end
end
