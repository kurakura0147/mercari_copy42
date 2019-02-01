class ChangeColumnNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :birthday, true
  end
end
