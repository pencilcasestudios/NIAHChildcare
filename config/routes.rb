NIAHChildcare::Application.routes.draw do
  # Welcome
  match "about", to: "welcome#about", as: "about"
  match "contact", to: "welcome#contact", as: "contact"
  match "fees", to: "welcome#fees", as: "fees"
  match "nannies", to: "welcome#nannies", as: "nannies"
  match "register", to: "welcome#register", as: "register"
  match "terms", to: "welcome#terms", as: "terms"

  # User
  match "registration", to: "users#new", as: "registration"
  match "sign_in", to: "sessions#new", as: "sign_in"
  match "sign_out", to: "sessions#destroy", as: "sign_out"




  resources :family_profiles
  resources :nanny_portraits
  resources :nanny_profiles
  resources :sessions
  resources :users

  resources :family_profiles do
    resources :nanny_portraits
    resources :notes
  end

  resources :nanny_portraits do
    resources :notes
  end

  resources :nanny_profiles do
    member do
      get "resume"
    end
    resources :notes
  end




  root to: "welcome#index"
end
