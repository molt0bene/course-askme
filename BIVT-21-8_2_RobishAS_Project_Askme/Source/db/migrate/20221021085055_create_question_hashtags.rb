class CreateQuestionHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :question_hashtags do |t|
      t.references :question, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
