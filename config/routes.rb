# Rails.application.routes.draw do

#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#   get "/articles", to: "articles#index"
#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end
# root "articles#index"

Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, path: 'articles_path', path_names: { sign_in: 'login' }

  root "articles#index"
  delete 'logout', to: 'sessions#destroy'
  # get "devise/sessions#destroy"
  resources :articles do
    resources :comments, only: [:create, :destroy] do
      resources :replies, only: [:create, :destroy]
    end
  end

end
