Rails.application.routes.draw do
  root "users#index"
  resources :users
  namespace :api, { format: 'json' } do
    resources :tasks
  end
  match '*path' => 'options_request#preflight', via: :options
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
