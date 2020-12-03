class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do
  validates :nickname
  validates :email, uniqueness: { case_sensitive: true }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX}
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :surname, :name, format: { with: VALID_NAME_REGEX}
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :surname_kana, :name_kana, format: { with: VALID_KANA_NAME_REGEX}
  validates :birthday_id
 end

  has_many :items
  has_many :purchases
end
