class AddVisibleToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :visible, :boolean
  end
end
