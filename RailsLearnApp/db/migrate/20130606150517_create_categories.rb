class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :supercategory_id
      t.string :name, :null => false

      t.timestamps
    end
		add_index :categories, :supercategory_id
  end
end
