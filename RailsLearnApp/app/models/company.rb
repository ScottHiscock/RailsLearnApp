class Company < ActiveRecord::Base
  attr_accessible :dic, :ico, :name, :user_id
	belongs_to :user
	
	validates_presence_of :name, :ico
end
