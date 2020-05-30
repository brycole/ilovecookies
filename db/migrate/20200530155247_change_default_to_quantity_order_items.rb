class ChangeDefaultToQuantityOrderItems < ActiveRecord::Migration[6.0]
  def change
    change_column_default :order_items, :quantity, 1
  end
end
