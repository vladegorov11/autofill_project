class AddProjectTypeAndStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_type, :integer
    add_column :projects, :archived, :boolean, default: false
    add_column :projects, :domain, :string 
  end
end
