class RenamePsotalToPostalInAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :psotal, :postal
  end
end
