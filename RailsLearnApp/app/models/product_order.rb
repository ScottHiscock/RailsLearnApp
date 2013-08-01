class ProductOrder < ActiveRecord::Base
  set_table_name "products_orders"
  attr_accessible :order_id, :product_id, :quantity
	belongs_to :product
	belongs_to :order
end
