class AddColumnsTbProducts < ActiveRecord::Migration
  def change
	 add_column :products, :active, :boolean, :default => true
   add_column :products, :discount, :integer
	end
end
