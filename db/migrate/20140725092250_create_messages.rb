class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :message_title
      t.string :message_body
      t.timestamps
    end
  end
end
