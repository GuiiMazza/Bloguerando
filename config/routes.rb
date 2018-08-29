Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end
