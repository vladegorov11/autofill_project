class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :projects, :user_id
  end
end
