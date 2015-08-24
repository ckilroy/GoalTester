class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :text, null: false
      t.boolean :private
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
