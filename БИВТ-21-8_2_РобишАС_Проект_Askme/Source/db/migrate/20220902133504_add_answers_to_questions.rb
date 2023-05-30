class AddAnswersToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answer, :text
  end
end
