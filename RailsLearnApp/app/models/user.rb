class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :activated, :activation_key, :telephone
  attr_accessible :add_address, :add_company
  attr_accessor :password, :add_address, :add_company
	
	has_many :orders
	has_one :address
	has_one :company
	
	accepts_nested_attributes_for :address, :reject_if => !:add_address
	accepts_nested_attributes_for :company, :reject_if => !:add_company
	
  #accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:city].blank? }
  #accepts_nested_attributes_for :company, :reject_if => lambda { |a| a[:name].blank? }

  #accepts_nested_attributes_for :address, :reject_if => lambda { |a| !user.add_address }
  #accepts_nested_attributes_for :company, :reject_if => lambda { |a| !user.add_company }
  
	attr_accessible :address_attributes, :company_attributes
	
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
