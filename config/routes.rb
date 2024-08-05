Rails.application.routes.draw do
  root 'qps#index'
  resources :qps, only: [:index] do
    collection do
      post 'end_qp'
    end
  end
end
