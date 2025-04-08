class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :score
      t.string :author
      t.string :url
      t.string :type
      t.string :details
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
