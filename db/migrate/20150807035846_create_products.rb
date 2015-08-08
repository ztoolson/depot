class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.string :image_url
      t.decimal :price, precision: 8, scale:2 # 8 significant digits, 2 decimal points

      t.timestamps
    end
    add_index :products, :title
  end
end
