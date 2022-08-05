class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :street, :building, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :street
    validates :telephone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid"}
    validates :token, presence: { message: "can't be blank" }
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, street: street, building: building, telephone: telephone, purchase_id: purchase.id)   
  end
end