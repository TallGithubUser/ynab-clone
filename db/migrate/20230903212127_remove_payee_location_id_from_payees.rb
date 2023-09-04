class RemovePayeeLocationIdFromPayees < ActiveRecord::Migration[7.0]
  def change
    remove_column :payees, :payee_location_id, :string
  end
end
