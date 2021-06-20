class CreateItemsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :items_orders do |t|
      t.integer :item_id, null: false, index: true
      t.integer :order_id, null: false, index: true
    end
  end
end
