Rails.application.routes.draw do
  if Rails.env.development?
    resources :screens, only: [:index, :show]
  end
end
