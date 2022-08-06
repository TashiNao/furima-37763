class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :street, :building, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :telephone, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid' }
    validates :token
  end
    validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, street: street, building: building,
                   telephone: telephone, purchase_id: purchase.id)
  end
end
