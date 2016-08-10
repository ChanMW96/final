class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :name
      t.integer :user_id
      t.integer :user_type
      t.integer :goal
      t.integer :time
      t.integer :total_amount
      t.string :description_1
      t.string :description_2
      t.string :description_3

      t.timestamps null: false
    end
  end
end
