class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseRecord.new
  end

  def create
    purchase = PurchaseRecord.create(purchase_params)
    Address.create(address_params(purchase))
  end

  private
  def purchase_params
    params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params(purchase)
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(purchase_record_id: purchase.id)
  end
end
