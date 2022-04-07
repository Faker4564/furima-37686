class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,         null: false      
      t.text    :product_description,  null: false
      t.integer :category_id,          null: false
      t.integer :product_condition_id, null: false
      t.integer :delivery_charge_id,   null: false
      t.integer :prefecture_id,        null: false
      t.integer :delivery_date_id,     null: false
      t.integer :price,                null: false
      t.timestamps
    end
  end
end
