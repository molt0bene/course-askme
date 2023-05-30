class AddHeaderColorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :header_color, :string
  end
end
