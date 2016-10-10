class ShopsController < ApplicationController

  before_action :find_shop, only: [:edit, :update, :destroy]

  def top
    @search = Search.new
    @search.date = Date.today.to_s
    @search.time = '1'
    @shops = nil
  end

  def search
    @search = Search.new(search_params)
    unless @search.valid?
       return render 'top'
    end
    @shops = search_shops
    render 'top'
  end

  def index
    @shops = Shop.all.order('id')
  end

  def create
    logger.debug(shop_params)
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path
    else
      render 'new'
    end
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shops_path
    else
      render 'edit'
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params[:shop].permit(:name, :price, :url, :mon1, :mon2, :tue1, :tue2, :wed1, :wed2, :thu1, :thu2, :fri1, :fri2, :sat1, :sat2, :sun1, :sun2, :hol1, :hol2)
  end

  def search_params
    params[:search].permit(:date, :time)
  end

  def search_shops
    # 曜日チェック
    wdays = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]
    d = Date.strptime(@search.date, "%Y-%m-%d")
    str = ""
    if HolidayJp.holiday?(d)
      str = "hol" + @search.time.to_s
    else
      str = wdays[d.wday] + @search.time.to_s
    end
    Shop.where('? IS TRUE', str).order('id')
  end

  def find_shop
    @shop = Shop.find(params[:id])
  end
end
