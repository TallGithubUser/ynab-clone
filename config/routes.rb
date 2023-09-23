Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "budget#default_budget_view"

  scope ':budget_id' do
    resources :account
  end

  scope ':budget_id' do
    resources :budget
  end

  scope ':budget_id' do 
    resources :transaction
  end

  # Budget view
  get "no-budgets-found", to: "budget#no_budgets_found"

end