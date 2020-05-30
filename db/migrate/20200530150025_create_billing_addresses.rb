class CreateBillingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :billing_addresses do |t|
      t.string :billing_name
      t.text :address

      t.timestamps
    end
  end
end
