class Order < ActiveRecord::Base
  attr_accessible :delivery_address_id, :delivery_type, :payment_address_id, :payment_type, :status, :total_price, :user_id
	has_many :product_orders
	has_many :products, :through => :product_orders
	belongs_to :address, :foreign_key => 'payment_address_id'
	belongs_to :address, :foreign_key => 'delivery_address_id'
	belongs_to :user
end
