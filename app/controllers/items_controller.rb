class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :image, :price, :category_id, :condition_id, :charge_id, :area_id, :delivery_day_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end

