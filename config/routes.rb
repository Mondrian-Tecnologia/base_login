Rails.application.routes.draw do
  resources :cidades
  resources :estados
  require 'sidekiq/web'
  #mount ActionCable.server => '/cable'

  devise_for :usuarios

  unauthenticated do
    root 'home#index', as: 'unauthenticated'
  end
  authenticated do
    root 'cidades#index'
    mount Sidekiq::Web => '/sidekiq'
  end

  ## ERROR
  get '/500', to: 'errors#internal_error'
end
