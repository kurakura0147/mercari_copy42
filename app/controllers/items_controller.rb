class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
          @items1 = Item.where(price: 1).limit(4).order("id DESC")
          @items2 = Item.where(price: 2).limit(4).order("id DESC")
          @items3 = Item.where(price: 3).limit(4).order("id DESC")
          @items4 = Item.where(price: 4).limit(4).order("id DESC")
  end

  def new

  end

  def show

  end

end
