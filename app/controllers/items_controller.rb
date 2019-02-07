class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @price1_items = Item.set_items(1)
    @price2_items = Item.set_items(2)
    @price3_items = Item.set_items(3)
    @price4_items = Item.set_items(4)
  end

  def new

  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: @item.user_id).sample(6)
    #brand_idをテーブルに追加後コメントアウトを外す
    # @brand_items = Item.where(brand_id: @item.brans_id).sample(6)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end
