class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :period

  with_options presence: true do
    validates :category_id
    validates :condition_id
    validates :payment_id
    validates :prefecture_id
    validates :period_id
  end
  
  with_options numerilality: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :payment_id
    validates :prefecture_id
    validates :period_id
  end

end
