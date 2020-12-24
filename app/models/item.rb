class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :period

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :payment_id
    validates :prefecture_id
    validates :period_id
    validates :price
  end
  
  with_options numericality: {other_than: 0} do
    validates :category_id
    validates :condition_id
    validates :payment_id
    validates :prefecture_id
    validates :period_id
  end

end
