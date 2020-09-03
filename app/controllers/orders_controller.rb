class OrdersController < ApplicationController

  before_action :check_login
  before_action :get_record
  before_action :check_user
  before_action :check_status

  def index
    @order = OrderPurchase.new
  end

  def create
    @order = OrderPurchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def get_record
    @item = Item.find(params[:item_id])
  end

  def check_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def check_user
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def check_status
    if @item.order
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_purchase).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
