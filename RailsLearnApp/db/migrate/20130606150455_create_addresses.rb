class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name, :null => false
      t.string :surname, :null => false
      t.string :city, :null => false
      t.string :street, :null => false
      t.integer :postcode, :null => false
      t.string :state, :null => false

      t.timestamps
    end
  end
end
