class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :payment_address_id, :null => false
      t.integer :delivery_address_id, :null => false
      t.integer :user_id, :null => false
      t.string :payment_type, :null => false
      t.string :delivery_type, :null => false
      t.decimal :total_price, :null => false
      t.boolean :status, :null => false

      t.timestamps
    end
		add_index :orders, :payment_address_id
		add_index :orders, :delivery_address_id
		add_index :orders, :user_id
  end
end
