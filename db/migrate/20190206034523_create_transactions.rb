class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
