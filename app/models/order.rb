class Order < ApplicationRecord
	has_many :item_orders
  has_many :items, through: :item_orders
  belongs_to :user

  STATE = { drafted: 'drafted', pending: 'pending', completed: 'completed' }.freeze
end