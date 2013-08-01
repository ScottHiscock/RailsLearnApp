class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, :null => false
      t.string :password_hash, :null => false
			t.string :password_salt, :null => false
			t.string :role, :null => false, :default => "admin"
			
      t.timestamps
    end
  end
end
