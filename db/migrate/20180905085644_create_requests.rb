class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer  :count , default: 0
      t.integer :group_id
      t.timestamps
    end
    add_index :requests, :group_id
  end
end
