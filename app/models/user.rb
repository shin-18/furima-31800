class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do
  validates :nickname
  validates :email, uniqueness: { case_sensitive: true }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :surname, :name, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :surname_kana, :name_kana, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }
  validates :birthday_id
 end

  has_many :items
  has_many :purchases
end
