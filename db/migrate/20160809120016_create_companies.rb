class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :description
      t.string :password_digest
      t.string :location
      t.string :image

      t.timestamps null: false
    end
  end
end
