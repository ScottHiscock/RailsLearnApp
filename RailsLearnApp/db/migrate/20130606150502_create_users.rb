class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :address_id
      t.integer :company_id
      t.string :email, :null => false
      t.string :password, :null => false
      t.integer :telephone
      t.string :activation_key, :null => false
      t.boolean :activated, :null => false, :default => '0'

      t.timestamps
    end
		add_index :users, :address_id
		add_index :users, :company_id
  end
end
