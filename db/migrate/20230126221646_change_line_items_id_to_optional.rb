class ChangeLineItemsIdToOptional < ActiveRecord::Migration[7.0]
  change_column_null :orders, :line_items_id, true
  def change
  end
end
