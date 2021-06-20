class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :item_type, null: false
      t.integer :price
      t.integer :discount

      t.timestamps
    end
  end
end
