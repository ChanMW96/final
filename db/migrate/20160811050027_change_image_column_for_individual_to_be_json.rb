class ChangeImageColumnForIndividualToBeJson < ActiveRecord::Migration
  def change
  	remove_column :individuals, :image, :string
  	add_column :individuals, :images, :json
  end
end
