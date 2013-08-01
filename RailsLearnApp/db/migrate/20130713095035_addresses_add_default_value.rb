class AddressesAddDefaultValue < ActiveRecord::Migration
  def change
    change_column :addresses, :state, :string, :default => "Czech Republic"
  end
end
