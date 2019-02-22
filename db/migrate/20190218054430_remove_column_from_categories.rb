class RemoveColumnFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :parent_id, :integer
    remove_column :categories, :lft, :integer
    remove_column :categories, :rgt, :integer
  end
end
