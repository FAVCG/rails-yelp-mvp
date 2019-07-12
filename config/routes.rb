Rails.application.routes.draw do
  # VERB "PATH", to: "CONTROLLER#ACTION"
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end
end
