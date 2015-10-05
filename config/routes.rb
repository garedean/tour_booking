Rails.application.routes.draw do
  root to: "tours#new"
  resources :tours
end
