class ChangeDataTitleToItem < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :title, :string
  end
end
