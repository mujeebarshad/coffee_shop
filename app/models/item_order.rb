class ItemOrder < ApplicationRecord
	self.table_name = "items_orders"

  belongs_to :order
  belongs_to :item
end