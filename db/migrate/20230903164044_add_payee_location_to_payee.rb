class AddPayeeLocationToPayee < ActiveRecord::Migration[7.0]
  def change
    add_reference :payees, :payee_location, null: false, foreign_key: true
  end
end
