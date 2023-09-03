class AddCategoryGroupToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :category_group, null: false, foreign_key: true
  end
end
