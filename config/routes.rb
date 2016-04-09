Rails.application.routes.draw do

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  namespace :admin do
    resources :collectors
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :forms, only: [:index]
    end
  end

end
