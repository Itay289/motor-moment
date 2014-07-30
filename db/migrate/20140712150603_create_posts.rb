class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.string :post
      t.string :image
      t.references :contact
      t.references :comment
      t.timestamps
    end
  end
end
