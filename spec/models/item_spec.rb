require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品商品の保存' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '保存ができるとき' do
      it "image, name, description, category_id, condition_id, payment_id, prefecture_id, period_id, priceが存在すれば保存できる" do
        expect(@item).to be_valid
      end
    end

    context '保存ができないとき' do
      it "imageが空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと保存できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idの値が0だと保存できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid. Select status.")
      end
      it "condition_idが空だと保存できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idの値が0だと保存できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is invalid. Select status.")
      end
      it "payment_idが空だと保存できない" do
        @item.payment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it "payment_idの値が0だと保存できない" do
        @item.payment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment is invalid. Select status.")
      end
      it "period_idが空だと保存できない" do
        @item.period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end
      it "period_idの値が0だと保存できない" do
        @item.period_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Period is invalid. Select status.")
      end
      it "priceが空だと保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceの値が300より下だと保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number within range.")
      end
      it "priceの値が9,999,999より上だと保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number within range.")
      end
      it "priceが半角数字以外だと保存できない" do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number within range.")
      end
    end
  end
end
