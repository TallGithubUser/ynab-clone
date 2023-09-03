class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :uid
      t.string :name
      t.boolean :hidden
      t.string :note
      t.integer :budgeted
      t.integer :activity
      t.integer :balance
      t.string :goal_type
      t.integer :goal_day
      t.integer :goal_cadence
      t.integer :goal_cadence_frequency
      t.date :goal_creation_month
      t.integer :goal_target
      t.date :goal_target_month
      t.integer :goal_percentage_complete
      t.integer :goal_months_to_budget
      t.integer :goal_overall_funded
      t.integer :goal_overall_left
      t.boolean :deleted

      t.timestamps
    end
  end
end
