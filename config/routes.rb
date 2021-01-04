Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, except: :index do
    resources :purchase_records, only: [:index, :create]
  end
end
