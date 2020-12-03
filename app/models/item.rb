class Item < ApplicationRecord
    belongs_to :user
    has_one :purchase
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :area
    belongs_to :days

    validates :image, presence: true
    validates :product_name, :explanation, presence: true
    validates :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
    
end
