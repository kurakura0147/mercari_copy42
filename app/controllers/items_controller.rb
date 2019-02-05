class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @price1_items = Item.where(price: 1).limit(4).order("id DESC")
    @price2_items = Item.where(price: 2).limit(4).order("id DESC")
    @price3_items = Item.where(price: 3).limit(4).order("id DESC")
    @price4_items = Item.where(price: 4).limit(4).order("id DESC")
  end

  def new

  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: @item.user_id).sample(6)
    #brand_idをテーブルに追加後コメントアウトを外す
    # @brand_items = Item.where(brand_id: @item.brans_id).sample(6)
  end

end
