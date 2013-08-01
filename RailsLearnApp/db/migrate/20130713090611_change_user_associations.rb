class ChangeUserAssociations < ActiveRecord::Migration
  def change
    
    sql = <<-SQL
      ALTER TABLE users DROP FOREIGN KEY fk_users_addresses;
      ALTER TABLE users DROP FOREIGN KEY fk_users_companies;
    SQL
    
    sql.strip.split(';').each do |s|
      ActiveRecord::Base.connection.execute(s)
    end 
      
    change_table(:users) do |t|
      t.remove :address_id
      t.remove :company_id
      t.remove_index :address_id
      t.remove_index :company_id
    end
    
    add_column :addresses, :user_id, :integer
    add_column :companies, :user_id, :integer
    add_index :addresses, :user_id
    add_index :companies, :user_id
    
    sql = <<-SQL
      ALTER TABLE addresses
        ADD CONSTRAINT fk_addresses_users
        FOREIGN KEY (user_id)
        REFERENCES users(id);
      
      ALTER TABLE companies
        ADD CONSTRAINT fk_companies_users
        FOREIGN KEY (user_id)
        REFERENCES users(id);
    SQL
    
    sql.strip.split(';').each do |s|
      ActiveRecord::Base.connection.execute(s)
    end 
    
  end
end
