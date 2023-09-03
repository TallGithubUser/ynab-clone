class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :uid
      t.string :name
      t.time :last_modified_on
      t.date :first_month
      t.date :last_month

      t.timestamps
    end
  end
end
