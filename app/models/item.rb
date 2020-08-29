class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :detail, :category, :status, :burden, :prefecture, :delivery_date, :price, presence: true

  validates :category_id, :status_id, :burden_id, :prefecture_id, :delivery_date_id, numericality: { other_than: 1, message: 'Select' }

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price, numericality: { with: PRICE_REGEX, message: 'Half-width number' }

  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }
end
