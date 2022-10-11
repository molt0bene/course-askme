class SetDefaultOfHeaderColor < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :header_color, '#370617'
  end
end
