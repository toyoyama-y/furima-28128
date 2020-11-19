class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string  :name
      t.text    :text
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_fee_id
      t.integer :area_id
      t.integer :day_id
      t.integer :price
      t.timestamps
    end
  end
end
