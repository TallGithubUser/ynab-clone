class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :uid
      t.string :name
      t.string :type
      t.boolean :on_budget
      t.boolean :closed
      t.string :note
      t.integer :balance
      t.integer :cleared_balance
      t.integer :uncleared_balance
      t.string :transfer_payee_id
      t.boolean :direct_import_linked
      t.time :last_reconciled_at
      t.boolean :deleted

      t.timestamps
    end
  end
end
