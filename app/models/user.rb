class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_information
  validates :nickname, null: false
  validates :first_name, null: false
  validates :last_name, null: false
  validates :first_name_kana, null: false
  validates :last_name_kana, null: false
  validates :birth_date, null: false
end
