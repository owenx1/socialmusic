class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.text :about
      t.string :artwork

      t.timestamps
    end
  end
end
