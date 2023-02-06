class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :pay_method
      t.timestamps

      t.references :user, foreign_key: true
      t.references :cart, foreign_key: true
    
      
    end
  end
end

