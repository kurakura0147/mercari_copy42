class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :buy, :pay]

  def index
          @price1_items = Item.where(price: 1).limit(4).order("id DESC")
          @price2_items = Item.where(price: 2).limit(4).order("id DESC")
          @price3_items = Item.where(price: 3).limit(4).order("id DESC")
          @price4_items = Item.where(price: 4).limit(4).order("id DESC")
  end

  def new
  end

  def show
  end

  def buy
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
          charge = Payjp::Charge.create(
          :amount => @item.price,
          :card => params['payjp-token'],
          :currency => 'jpy',
    )
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end
