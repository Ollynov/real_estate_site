class AddPriceToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :price, :integer
  end
end
