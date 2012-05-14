class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
