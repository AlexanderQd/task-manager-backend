Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :clients
    resources :projects
    resources :tasks
    resources :tasks_registers, only: [:create, :update, :destroy]

    post 'login', to: 'authentication#login', defaults: { format: :json }
  end
end
