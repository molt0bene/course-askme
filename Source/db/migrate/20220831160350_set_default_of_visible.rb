class SetDefaultOfVisible < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :visible, true
  end
end
