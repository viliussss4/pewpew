Rails.application.routes.draw do

  resources :sports, only: [:index, :show] do
    resources :events, only: [:index, :show] do
      resources :outcomes, only: :index
    end
  end

end
