class RemoveCategoryFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :transactions, :category, null: false, foreign_key: true
  end
end
