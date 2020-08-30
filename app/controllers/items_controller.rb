class ItemsController < ApplicationController
  before_action :check_login, except: [:index, :show]
  before_action :get_record, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC').includes(:order)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :burden_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def check_login
    redirect_to root_path unless user_signed_in?
  end

  def get_record
    @item = Item.find(params[:id])
  end
end
