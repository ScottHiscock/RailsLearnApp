class Address < ActiveRecord::Base
  attr_accessible :city, :name, :postcode, :state, :street, :surname, :user_id
	has_many :orders, :foreign_key => 'payment_address_id'
	has_many :orders, :foreign_key => 'delivery_address_id'
	belongs_to :user
	
	validates_presence_of :name, :surname, :city, :street, :postcode, :state
	
end
