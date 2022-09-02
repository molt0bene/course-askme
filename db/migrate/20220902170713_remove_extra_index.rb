class RemoveExtraIndex < ActiveRecord::Migration[5.2]
  # it was created by mistake
  def change
    remove_index :users, column: [nil], name: "index_users_on_emails"
  end
end
