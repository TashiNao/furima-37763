class RemoveProductNameFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :product_name, :string
  end
end
