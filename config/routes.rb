Rails.application.routes.draw do
  root to: "licenses#index"

  resources :licenses
end
