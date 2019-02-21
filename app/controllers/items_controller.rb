class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy, :buy, :pay]

  def index
    @price1_items = Item.set_items(1)
    @price2_items = Item.set_items(2)
    @price3_items = Item.set_items(3)
    @price4_items = Item.set_items(4)
  end

  def new
    @item = Item.new
    @brand = Brand.all
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: @item.user_id).sample(6)
    #brand_idをテーブルに追加後コメントアウトを外す
    # @brand_items = Item.where(brand_id: @item.brans_id).sample(6)
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

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to items_path
  end

  def search_brand
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%").limit(6)
    respond_to do |format|
      format.json { render 'new', json: @brands }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, {image: []}, :detail, :state, :price, :delivery_cost, :delivery_area, :delivery_day, :size, :category_id, :delivery, :brand_id).merge(user_id: current_user.id)
  end

end
