class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.integer :user_id
      t.integer :user_type
      t.integer :goal
      t.integer :time
      t.integer :total_amount, default: 0
      t.string :description
      t.json :images
      t.json :required_talents

      t.timestamps null: false
    end
  end
end
