class CreateCategoryGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :category_groups do |t|
      t.string :uid
      t.boolean :hidden
      t.boolean :deleted

      t.timestamps
    end
  end
end
