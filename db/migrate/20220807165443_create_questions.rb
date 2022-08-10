class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
