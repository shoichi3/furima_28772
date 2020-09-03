class OrderPurchase

  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city
    validates :address
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "Select"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end