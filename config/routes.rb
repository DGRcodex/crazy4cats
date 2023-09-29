Rails.application.routes.draw do
  resources :publications
  devise_for :users
  post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'
  resources :comments, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "publications#index"
end
