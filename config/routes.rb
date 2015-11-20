Rails.application.routes.draw do
  resources :students do
    collection do
      get :search, as: :search
    end
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
