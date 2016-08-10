Rails.application.routes.draw do
  resources :transactions, controller: "transactions"
  resource :sessions, controller: "sessions"
  resources :users, controller: "users"
  resources :individuals, controller: "individuals"
  resources :companies, controller: "companies"
  resources :updates, controller: "updates"
  resources :fundings, controller: "fundings"
  resources :comments, controller: "comments"
  resources :companies, controller: "companies"
  resources :projects, controller: "projects"
  resources :projects do
    collection do
      post :email
    end
  end
  resources :projects do
    collection do
      post :search
    end
  end
  root 'home#index'
end