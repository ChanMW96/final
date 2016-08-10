class CreateFundings < ActiveRecord::Migration
  def change
    create_table :fundings do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :user_type
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
