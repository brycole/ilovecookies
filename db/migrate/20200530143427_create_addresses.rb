class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :customer_name
      t.text :full_address
      t.integer :billing_or_shipping

      t.timestamps
    end
  end
end
