require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品の購入' do
    before do
      @purchase = FactoryBot.build(:purchase_address)
    end

    context '購入できるとき' do
      it '全ての要素が適切に入力されていると購入できること' do
        expect(@purchase).to be_valid
      end
      it 'building_nameが空でも購入できること' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空では購入できないこと' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「(半角数字3桁」)(半角ハイフン(-))(半角数字4桁)」の形式でないと購入できないこと' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid. Input correctly.')
      end
      it 'prefecture_idが空では購入できないこと' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの値が0だと購入できないこと' do
        @purchase.prefecture_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture is invalid. Select status.')
      end
      it 'cityが空では購入できないこと' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できないこと' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できないこと' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと購入できないこと' do
        @purchase.phone_number = '０１２３４５６７８９０'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid. Input half-width numbers.')
      end
      it 'phone_numberが英数混合だと購入できないこと' do
        @purchase.phone_number ='abcd1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid. Input half-width numbers.')
      end
      it 'phone_numberが12桁以上だと購入できないこと' do
        @purchase.phone_number = '123456789012'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid. Input number within 11 digits.')
      end
      it 'tokenが空では購入できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
