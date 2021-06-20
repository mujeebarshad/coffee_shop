class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 70 }
  has_many :item_orders
  has_many :orders, through: :item_orders

  ITEM_TYPES = { beverages: 'Beverage', burger: 'Burger', sandwich: 'Sandwich' }.freeze
end