Rails.application.routes.draw do
  resources :properties do
    resources :repairs do
      collection do
        get :new_appointment
      end
    end
  end
end
