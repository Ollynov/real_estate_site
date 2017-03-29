class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.string :home_type
      t.integer :bed_room
      t.integer :bath_room
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_furnished
      t.boolean :is_ready
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
