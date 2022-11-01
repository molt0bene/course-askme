class RemoveQuestionIdFromHashtags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :hashtags, :question_id, index: true, foreign_key: true
    remove_column :hashtags, :question_id
  end
end
