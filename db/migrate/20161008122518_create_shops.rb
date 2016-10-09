class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.boolean :mon1, default: false
      t.boolean :mon2, default: false
      t.boolean :tue1, default: false
      t.boolean :tue2, default: false
      t.boolean :wed1, default: false
      t.boolean :wed2, default: false
      t.boolean :thu1, default: false
      t.boolean :thu2, default: false
      t.boolean :fri1, default: false
      t.boolean :fri2, default: false
      t.boolean :sat1, default: false
      t.boolean :sat2, default: false
      t.boolean :sun1, default: false
      t.boolean :sun2, default: false
      t.boolean :hol1, default: false
      t.boolean :hol2, default: false
      t.integer :price
      t.string :url

      t.timestamps
    end
  end
end
