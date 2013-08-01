class Product < ActiveRecord::Base
  attr_accessible :category_id, :active, :discount, :description, :image, :image_path, :name, :price, :quantity
	has_many :product_orders
	has_many :orders, :through => :product_orders
	belongs_to :category
	#has_attached_file :photo, :styles => { :thumb => "100x100#" }
	mount_uploader :image, ImageUploader
end
