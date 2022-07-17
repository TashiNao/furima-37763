class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  belongs_to :user
end
