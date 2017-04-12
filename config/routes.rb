Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :channels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "public#homepage"

  get 'test/:action', to: "test#:action"

end
