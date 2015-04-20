Rails.application.routes.draw do
  resources :emergencies, param: :code
end
