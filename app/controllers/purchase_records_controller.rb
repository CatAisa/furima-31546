class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    user = current_user
    item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    @purchase_address.save(user, item)
  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
