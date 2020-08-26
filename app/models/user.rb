class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_information
  
  validates :nickname, presence: true
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: 'Full-width characters'} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: 'Full-width katakana characters'} do
    validates :first_name_kana
    validates :last_name_kana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format: { with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'} do
    validates :password
  end
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'
end
