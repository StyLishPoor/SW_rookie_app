Rails.application.routes.draw do
  # 個別ルートは使用しない
  # get 'entries/new'
  # get 'entries/create'
  # get 'entries/destroy'
  # get 'entries/index'
  # get 'entries/confirm'
  resources :rooms
  resources :entries, only: [:new, :create, :destroy, :index], path: :rentals do
    post :confirm, on: :collection
  end
  root to: 'top#index'
  get 'top/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
