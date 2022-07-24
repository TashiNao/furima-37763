class RenameDeliveryDayIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_day_id, :deliveryday_id
  end
end
