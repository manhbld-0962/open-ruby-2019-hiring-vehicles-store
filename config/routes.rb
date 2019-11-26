Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    resources :users, only: :create
    resources :admin, only: :index
    resources :hirings, only: %i(new create index)
    resources :branchs, only: %i(index show)

    resources :vehicles, only: :show do
      resources :comments
    end

    resources :comments do
      resources :comments
    end

    namespace :admin do
      resources :vehicles, except: :show
      resources :branchs, except: :show
      resources :hirings
    end
  end
end
