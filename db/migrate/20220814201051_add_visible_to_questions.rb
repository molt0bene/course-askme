class AddVisibleToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :visible, :boolean, default: true
  end
end
