Rails.application.routes.draw do
  root to: "tours#new"
  resources :tours do
    resources :tour_steps
  end
end
