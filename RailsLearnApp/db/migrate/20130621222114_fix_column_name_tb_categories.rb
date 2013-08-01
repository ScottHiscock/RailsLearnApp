class FixColumnNameTbCategories < ActiveRecord::Migration
	def change
    rename_column :categories, :supercategory_id, :category_id
  end
end
