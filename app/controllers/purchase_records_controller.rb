class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseRecord.new
  end

  def create
    @purchase_record = PurchaseRecord.create(purchase_record_params)
  end

  private
  def purchase_record_params
    params.require(:purchase_record).permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
