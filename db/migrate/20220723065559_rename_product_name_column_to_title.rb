class RenameProductNameColumnToTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :product_name, :title
  end
end
