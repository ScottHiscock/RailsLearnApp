class Category < ActiveRecord::Base
  attr_accessible :name, :category_id
  #belongs_to :category, :class_name => "Category", :foreign_key => "category_id"
	#has_many :categories, :class_name => "Category", :foreign_key => "category_id"
  belongs_to :parent, :class_name => "Category"
  has_many :categories, :foreign_key => "category_id"
  
  has_many :products
end
