class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Input correctly.' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'is invalid. Select status.' }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width numbers.' }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :phone_number, length: { maximum: 11, message: 'is invalid. Input number within 11 digits.' }

  def save
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, purchase_record_id: purchase.id)
  end
end
