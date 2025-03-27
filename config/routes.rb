Rails.application.routes.draw do
  resources :tickets, param: :ean_code do
    member do
      post :cash_out
    end
  end
end
