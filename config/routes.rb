NIAHChildcare::Application.routes.draw do
  get "sessions/new"

  get "welcome/about"
  get "welcome/contact"
  get "welcome/fees"
  get "welcome/nannies"
  get "welcome/terms"




  match "about", to: "welcome#about", as: "about"
  match "contact", to: "welcome#contact", as: "contact"
  match "fees", to: "welcome#fees", as: "fees"
  match "nannies", to: "welcome#nannies", as: "nannies"
  match "sign_in", to: "sessions#new", as: "sign_in"
  match "sign_out", to: "sessions#destroy", as: "sign_out"
  match "sign_up", to: "users#new", as: "sign_up"
  match "terms", to: "welcome#terms", as: "terms"




  resources :users




  root to: "welcome#index"
end
