class AddImagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :images, :json
    add_column :individuals, :images, :json
    add_column :projects, :images, :json
    add_column :projects, :required_talents,:json
  end
end
