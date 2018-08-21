Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  resources :projects do
    resources :groups do
      resources :tags
    end
  end
end
