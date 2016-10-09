class CreateShopPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_places do |t|
      t.boolean :apply, default: false
      t.references :shop, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
