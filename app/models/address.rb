class Address < ApplicationRecord
  belongs_to :purchase

  # validates :postal, presence: true, format:{with: /\A[0-9{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :city, presence: true
  # validates :street, presence: true
  # validates :telephone, presence: true, format: {with: /\A[0-9]{3-[0-9]{4}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}}
end
