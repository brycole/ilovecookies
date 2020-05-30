class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :delivery_name
      t.text :address

      t.timestamps
    end
  end
end
