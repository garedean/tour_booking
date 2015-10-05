Rails.application.routes.draw do
  root to: "tours#new"

  get 'tour_booked!', to: 'tours#tour_booked', as: 'tour_booked'

  resources :tours do
    get 'rate_tour', on: :member, only: [:show]
    resources :tour_steps
  end
end
