class Item < ApplicationRecord
  belongs_to :user
  has_many :purchase_records
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
    validates :price,
              numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300,
                              message: 'is invalid. Input half-width number within range.' }
  end

  with_options numericality: { other_than: 0, message: 'is invalid. Select status.' } do
    validates :category_id
    validates :condition_id
    validates :payment_id
    validates :prefecture_id
    validates :period_id
  end
end
