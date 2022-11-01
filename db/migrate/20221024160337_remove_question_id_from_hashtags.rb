class RemoveQuestionIdFromHashtags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :hashtags, :question_id
    remove_column :hashtags, :question_id
  end
end
