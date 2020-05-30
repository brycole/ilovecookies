class AddDefaultToOrderItems < ActiveRecord::Migration[6.0]
  def change
    change_column_default :order_items, :quantity, 0
  end
end
