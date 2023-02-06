class AddMoreColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_money :products, :price, currency: { present: true }
  end
end
