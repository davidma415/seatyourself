Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resource :user, only: [:new, :create, :edit, :update, :show]
resources :restaurants do
  resources :reservations, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
resources :sessions, only: [:new, :create, :destroy]

root 'restaurant#index'

end
