class CreatePayees < ActiveRecord::Migration[7.0]
  def change
    create_table :payees do |t|
      t.string :uid
      t.string :name
      t.string :transfer_account_id
      t.boolean :deleted

      t.timestamps
    end
  end
end
