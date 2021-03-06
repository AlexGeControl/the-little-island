class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.string :address
      t.integer :accommodate
      t.integer :bed_room
      t.integer :bath_room
      t.boolean :is_tv
      t.boolean :is_wifi
      t.boolean :is_air
      t.boolean :is_heating
      t.boolean :is_kitchen
      t.boolean :is_bbq
      t.string :listing_name
      t.text :summary
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
