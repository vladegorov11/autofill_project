class CreateGroupRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :group_requests do |t|
      t.integer :count
      t.integer :group_id
    end
    add_index :group_requests, :group_id 
  end
end
