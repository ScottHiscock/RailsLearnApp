class AddForeignKeys < ActiveRecord::Migration
  def up
		# add a foreign key
    sql = <<-SQL
      ALTER TABLE products
        ADD CONSTRAINT fk_products_categories
        FOREIGN KEY (category_id)
        REFERENCES categories(id);

			ALTER TABLE products_orders
        ADD CONSTRAINT fk_ProductsOrders_products
        FOREIGN KEY (product_id)
        REFERENCES products(id);
			
			ALTER TABLE products_orders
        ADD CONSTRAINT fk_ProductsOrders_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(id);
				
			ALTER TABLE orders
        ADD CONSTRAINT fk_orders_PaymentAddresses
        FOREIGN KEY (payment_address_id)
        REFERENCES addresses(id);
			
			ALTER TABLE orders
        ADD CONSTRAINT fk_orders_DeliveryAddresses
        FOREIGN KEY (delivery_address_id)
        REFERENCES addresses(id);
			
			ALTER TABLE orders
        ADD CONSTRAINT fk_orders_users
        FOREIGN KEY (user_id)
        REFERENCES users(id);
				
			ALTER TABLE categories
        ADD CONSTRAINT fk_categories_categories
        FOREIGN KEY (supercategory_id)
        REFERENCES categories(id);
				
			ALTER TABLE users
        ADD CONSTRAINT fk_users_addresses
        FOREIGN KEY (address_id)
        REFERENCES addresses(id);
			
			ALTER TABLE users
        ADD CONSTRAINT fk_users_companies
        FOREIGN KEY (company_id)
        REFERENCES companies(id);	
    SQL
		
		sql.strip.split(';').each do |s|
			ActiveRecord::Base.connection.execute(s)
		end 
  end

  def down
		# drop a foreign key
		sql = <<-SQL
				ALTER TABLE products DROP FOREIGN KEY fk_products_categories;
				ALTER TABLE products_orders DROP FOREIGN KEY fk_ProductsOrders_products;
				ALTER TABLE products_orders DROP FOREIGN KEY fk_ProductsOrders_orders;
				ALTER TABLE orders DROP FOREIGN KEY fk_orders_PaymentAddresses;
				ALTER TABLE orders DROP FOREIGN KEY fk_orders_DeliveryAddresses;
				ALTER TABLE categories DROP FOREIGN KEY fk_categories_categories;
				ALTER TABLE users DROP FOREIGN KEY fk_users_addresses;
				ALTER TABLE users DROP FOREIGN KEY fk_users_companies;
		SQL
		
		sql.strip.split(';').each do |s|
			ActiveRecord::Base.connection.execute(s)
		end 
  end
end
