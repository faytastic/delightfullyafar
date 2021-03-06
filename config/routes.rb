Rails.application.routes.draw do
  devise_for :users
  resources :articles do
  	resources :attachments
  end
  
  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/help'

  get 'tags/:tag', to: 'articles#index', as: :tag


end
