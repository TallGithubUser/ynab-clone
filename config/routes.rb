Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "budget#default_budget_view"
  get "/:uid/budget", to: "budget#budget_view"
end
