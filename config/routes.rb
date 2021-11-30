Rails.application.routes.draw do
  root to: 'candidates#index'
  resources :candidates do
    member do
      post :vote
    end
  end
end
