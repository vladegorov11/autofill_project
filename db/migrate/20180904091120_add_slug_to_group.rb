class AddSlugToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :slug, :string, unique: true
  end
end
