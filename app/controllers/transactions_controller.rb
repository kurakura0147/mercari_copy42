class TransactionsController < ApplicationController

  def index
        @items = Item.where('name LIKE(?)', "%#{params[:search]}%")
  end

  def new
  end

end
