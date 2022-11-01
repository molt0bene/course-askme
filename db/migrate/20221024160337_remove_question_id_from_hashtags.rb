class RemoveQuestionIdFromHashtags < ActiveRecord::Migration[5.2]
  def change
    remove_column :hashtags, :question_id
  end
end
