class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :detail, null: false
      t.string :state, null: false
      t.integer :price, null: false
      t.string :delivery_cost, null: false
      t.string :delivery_area , null: false
      t.string :delivery_day, null: false
      t.string :size, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
