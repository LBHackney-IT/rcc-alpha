Rails.application.routes.draw do
  resources :properties do
    resources :repairs
  end
end
