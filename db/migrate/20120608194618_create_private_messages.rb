class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :sender
      t.integer :recipient
      t.string :subject
      t.text :message
      t.boolean :unread

      t.timestamps
    end
  end
end
