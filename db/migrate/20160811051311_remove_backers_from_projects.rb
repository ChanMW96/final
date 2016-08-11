class RemoveBackersFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :backers, :integer
  	add_column :projects, :backers, :integer, default: 0
  end
end
