Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  get 'projects/archive', to: 'projects#archive'
  resources :projects, shallow: true do
    get 'update-tokens', to: 'projects#regenerate_token', on: :member
    get 'archived', on: :member
    resources :groups do
      resources :tags
    end
  end
end
