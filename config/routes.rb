NIAHChildcare::Application.routes.draw do
  get "welcome/about"
  get "welcome/contact"
  get "welcome/fees"
  get "welcome/nannies"
  get "welcome/terms"




  match "about", :to => "welcome#about", :as => "about"
  match "contact", :to => "welcome#contact", :as => "contact"
  match "fees", :to => "welcome#fees", :as => "fees"
  match "nannies", :to => "welcome#nannies", :as => "nannies"
  match "terms", :to => "welcome#terms", :as => "terms"




  root to: "welcome#index"
end
