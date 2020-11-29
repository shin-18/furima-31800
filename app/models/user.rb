class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :surname, :name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :surname_kana, :name_kana, presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }
  validates :birthday_id, presence: true

  has_many :items
  has_many :purchases
end
