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

  end

end
