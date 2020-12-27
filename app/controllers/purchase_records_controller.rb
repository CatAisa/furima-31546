class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseRecord.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record = @item.purchase_records.new(purchase_record_params)
    @purchase_record.save
  end

  private
  def purchase_record_params
    params.require(:purchase_record).permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
