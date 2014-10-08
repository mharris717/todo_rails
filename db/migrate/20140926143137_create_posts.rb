class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.boolean :completed, null: false
      t.timestamps
    end
  end
end
