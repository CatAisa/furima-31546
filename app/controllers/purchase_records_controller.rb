class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if @item.user.id == current_user.id || !@item.purchase_record.nil?
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name,
                                             :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
