class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseRecord.new
  end

  def create
    purchase = PurchaseRecord.new(purchase_params)
    address = Address.new(address_params(purchase))
    binding.pry
  end

  private
  def purchase_params
    params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params(purchase)
    params.permit().merge(purchase_record_id: purchase.id)
  end
end
