Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, except: [:index] do
    resources :matches, only: [:create, :destroy]
  end

  resources :sessions, only:   [:new, :create, :destroy]
  resources :dogs,     only:   [:index, :destroy]
end
