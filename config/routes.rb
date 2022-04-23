Rails.application.routes.draw do
  scope :api do
    resources :users
    post 'login', to: 'authentication#login', defaults: { format: :json }
  end
end
