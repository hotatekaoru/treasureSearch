class ShopsController < ApplicationController

  before_action :find_shop, only: [:edit, :update, :destroy]
  
  def index
    @shops = Shop.all
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
    redirect_to shops_path
    else 
      render 'new'
    end
  end

  def new
    @shop = Shop.new
    @places = Place.includes(:shop_places)
        .where(shop_places: {shop_id: @shop.id})
        .order(:id)
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
    params[:shop].permit(:name, :price)
  end

  def find_shop
    @shop = Shop.find(params[:id])
  end
end
