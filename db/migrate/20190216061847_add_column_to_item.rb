class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, foreign_key: true
    add_column :items, :delivery, :string, null: false
    add_reference :items, :brand, foreign_key: true
  end
end
