class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :uid
      t.date :date
      t.integer :amount
      t.string :memo
      t.string :cleared
      t.boolean :approved
      t.string :flag_color
      t.boolean :deleted
      t.string :debt_transaction_type
      t.string :import_id
      t.string :matched_transaction_id

      t.timestamps
    end
  end
end
