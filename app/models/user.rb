class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :birth_date, presence: true

  NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/.freeze
  with_options presence: true, format: { with: NAME_REGEX, message: 'を全角文字で入力してください' } do
    validates :first_name
    validates :last_name
  end

  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  with_options presence: true, format: { with: NAME_KANA_REGEX, message: 'を全角(カタカナ)で入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format: { with: PASSWORD_REGEX, message: 'にはアルファベットと数字の両方が必要です' } do
    validates :password
  end
end
