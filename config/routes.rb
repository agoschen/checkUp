Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "pages/home", to: "pages#home"
  get "pages/about", to: "pages#about"
  get "pages/contact", to: "pages#contact"
  get "pages/faq", to: "pages#faq"

  # create routes for appountments, doctors and patients
  resources :appointments, only: [:index, :show]
  resources :doctors, only: [:index, :show]
  resources :patients, only: [:index, :show]
  resources :users, only: [:index, :show]
end
