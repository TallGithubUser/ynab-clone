class AddNameToCategoryGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :category_groups, :name, :string
  end
end
