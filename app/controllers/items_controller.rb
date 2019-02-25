class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search ]
  before_action :set_item, only: [:show, :edit, :destroy, :buy, :pay, :check, :update]
  before_action :set_category, only: :index

  def index

    # 表示する大カテゴリーのid:1を指定
    category_num = 1
    # => カテゴリーからid:1の大カテゴリーのデータを所得
    @category1 = Category.find(category_num)
    # => あいまい検索にてancestryから "(category_num) / = 1/"を検索
    @category = Category.search_ancestry(category_num)
    # => array で配列の定義をし上記よりcategory.idを代入する
    array = []
    array << @category.ids
    # => category_id,array[]より検索する。
    array.each do |num|
      @items1 = Item.search_category(num)
    end

    category_num = 2
    @category2 = Category.find(category_num)
    @category = Category.search_ancestry(category_num)
    array = []
    array << @category.ids
    array.each do |num|
      @items2 = Item.search_category(num)
    end

    category_num = 3
    @category3 = Category.find(category_num)
    @category = Category.search_ancestry(category_num)
    array = []
    array << @category.ids
    array.each do |num|
      @items3 = Item.search_category(num)
    end

    @brand1 = Brand.find(1)
    @item_brand = Item.search_brand(1)

  end

  def search
    @item = Item
    @item = Item.where('name LIKE(?)', "%#{params[:search]}%")
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
