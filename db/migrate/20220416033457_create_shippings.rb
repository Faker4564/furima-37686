class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postcode,      null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :block,         null: false
      t.string     :building
      t.string     :tel,           null: false
      t.references :buy,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
