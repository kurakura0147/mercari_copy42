class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
  end

  def new
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    binding.pry
    @item.destroy if @item.user_id == current_user.id
    redirect_to action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end
