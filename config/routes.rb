Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'index', to: 'pages#home'

  get 'appearance_testing', to: 'pages#appearance_testing'

  get 'corpus_search', to: 'corpus/examples#search', as: 'corpus_search'
end
