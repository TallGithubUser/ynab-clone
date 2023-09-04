class ChangeLastModifiedOnToDateTime < ActiveRecord::Migration[7.0]
  def up
    change_column :budgets, :last_modified_on, :datetime
  end

  def down
    change_column :budgets, :last_modified_on, :time
  end
end
