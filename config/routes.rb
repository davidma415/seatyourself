Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resource :user, only: [:new, :create, :edit, :update, :show]
resources :restaurants do
resources :reservations
end
resources :sessions, only: [:new, :create, :destroy]

root 'restaurants#index'

end
