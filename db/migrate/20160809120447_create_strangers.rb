class CreateStrangers < ActiveRecord::Migration
  def change
    create_table :strangers do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
