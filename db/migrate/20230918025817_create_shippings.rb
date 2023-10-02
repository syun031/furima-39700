class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string     :address,            null: false
      t.integer    :prefecture_id,      null: false
      t.string     :building_name
      t.string     :post_code,          null: false
      t.string     :phone_number,       null: false
      t.string     :city_town_village,  null: false
      t.references :purchase,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
