class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :post_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
