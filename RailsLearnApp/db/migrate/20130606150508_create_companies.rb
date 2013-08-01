class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :null => false
      t.integer :ico, :null => false
      t.integer :dic

      t.timestamps
    end
  end
end
