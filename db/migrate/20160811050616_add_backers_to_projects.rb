class AddBackersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :backers, :integer
  end
end
