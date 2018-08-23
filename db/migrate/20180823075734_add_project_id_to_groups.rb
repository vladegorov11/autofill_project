class AddProjectIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_index :groups, :project_id
  end
end
