Rails.application.routes.draw do
  resources :animes do
    resources :adds, only: [:create, :destroy], shallow: true
  end
  post '/rate' => 'rater#create', :as => 'rate'
  get "/review", to: "reviews#review"
  root "animes#index"

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords",
      confirmations: "users/confirmations"
    }
  resources :users, only: [:show]

  post '/search', to: 'static_pages#result'
  get '/search', to: 'static_pages#search'
  resources :reviews
end
