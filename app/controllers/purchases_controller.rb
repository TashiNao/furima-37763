class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id != current_user.id
      if @item.purchase.blank?
        @purchase_address = PurchaseAddress.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal, :prefecture_id, :city, :street, :building, :telephone, :item_id, :token).merge(
      user_id: current_user.id, token: params[:token], item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
