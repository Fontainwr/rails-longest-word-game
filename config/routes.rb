Rails.application.routes.draw do
  # get 'games/new'
  # get 'games/score'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new'
  match 'score', to: 'games#score', via: [:get, :post]
  # Defines the root path route ("/")
  # root "articles#index"
end
