Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show] do
    resources :purchase_records, only: :index
  end
end
