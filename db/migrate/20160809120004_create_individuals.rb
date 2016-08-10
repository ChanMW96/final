class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :name
      t.string :email
      t.string :occupation
      t.string :password_digest
      t.string :image

      t.timestamps null: false
    end
  end
end
