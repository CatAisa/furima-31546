class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end

  def save(user, item)
    purchase = PurchaseRecord.create(user_id: user.id, item_id: item.id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase.id)
  end
end