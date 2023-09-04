Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "budget#default_budget_view"

  # Account view
  get "/:uid/accounts", to: "account#account_view"
  
  # Budget view
  get "/:uid/budget", to: "budget#budget_view"
  get "no-budgets-found", to: "budget#no_budgets_found"
end
