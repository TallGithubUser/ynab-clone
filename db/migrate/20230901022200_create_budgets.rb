class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets, id: false, primary_key: :uid do |t|
      t.string :uid
      t.string :name
      t.time :last_modified_on
      t.date :first_month
      t.date :last_month
      t.string :date_format

      t.timestamps
    end
  end
end
