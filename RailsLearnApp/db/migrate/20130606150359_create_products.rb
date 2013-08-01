class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name, :null => false
      t.text :description
      t.decimal :price, :null => false
      t.integer :quantity
      t.string :image_path

      t.timestamps
    end
		add_index :products, :category_id
  end
end
