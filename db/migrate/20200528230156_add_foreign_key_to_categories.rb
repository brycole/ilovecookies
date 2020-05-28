class AddForeignKeyToCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :categories, :categories, column: :subcategory
  end
end
