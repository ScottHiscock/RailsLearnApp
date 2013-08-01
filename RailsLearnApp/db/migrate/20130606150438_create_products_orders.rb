class CreateProductsOrders < ActiveRecord::Migration
  def change
    # create_table :products_orders, :id => false do |t|
		create_table :products_orders do |t|
      t.integer :product_id, :null => false
      t.integer :order_id, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end
		add_index :products_orders, :product_id
		add_index :products_orders, :order_id
  end
end
