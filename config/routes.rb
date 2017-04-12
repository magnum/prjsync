Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "public#homepage"

  get 'test/:action', to: "test#:action"

end
