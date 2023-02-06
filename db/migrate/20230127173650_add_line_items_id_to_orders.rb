class AddLineItemsIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :line_items_id, :string
    
  end
end
