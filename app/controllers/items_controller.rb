class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy, :buy, :pay, :check, :update]
  before_action :set_category, only: :index

  def index
    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
    @brand1 = Brand.find(1)
    @items1 = Item.where(category_id: 119).order("id DESC")
    @items2 = Item.where(category_id: 302).order("id DESC")
    @items3 = Item.where(category_id: 431).order("id DESC")
    @item_brand = Item.where(brand_id: 1).order("id DESC")
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(params_item)
    @item.save
    redirect_to root_path
  end

  def show
    @user_items = Item.where(user_id: @item.user_id).sample(6)
    @brand_items = Item.where(brand_id: @item.brand_id).sample(6)
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

  def check
  end

  def edit
  end

  def update
    @item.update(params_item)
    redirect_to check_item_path
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

  def params_item
    params.require(:item).permit(:name, :detail, :state, :price, :delivery_cost, :delivery_area, :delivery_day, :size, :category_id, :delivery, :brand_id, item_images_attributes: [:image]).merge(user_id: current_user.id )
  end

  def set_category
    @category = Category.roots
  end

end
