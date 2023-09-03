class AddBudgetToCategoryGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_groups, :budget, null: false, foreign_key: true
  end
end
