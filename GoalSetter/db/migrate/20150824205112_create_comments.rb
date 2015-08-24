class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.integer :author_id, null: false, index: true
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end
