class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :active_status, default: true
      t.boolean :visible_homepage, default: true
      t.references :category

      t.timestamps
    end
  end
end
