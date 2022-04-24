Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :clients
    resources :projects
    resources :tasks
    resources :tasks_registers, only: [:create, :update, :destroy] do
      collection do
        get 'current_register_of_user/:user_id', to: 'tasks_registers#current_register_of_user'
      end
    end

    post 'login', to: 'authentication#login', defaults: { format: :json }
  end
end
