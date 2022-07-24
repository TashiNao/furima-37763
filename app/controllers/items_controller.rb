class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :price, :category_id, :condition_id, :charge_id, :area_id,
                                 :deliveryday_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
