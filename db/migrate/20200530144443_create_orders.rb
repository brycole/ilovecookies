class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :status
      t.float :total_amount
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
