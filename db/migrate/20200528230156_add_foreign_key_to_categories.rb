class AddForeignKeyToCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :categories, :categories, column: :sub_category_id
  end
end
