class AddDeleteColumsToPrivateMessages < ActiveRecord::Migration
  def change
    add_column :private_messages, :sender_deleted, :boolean, :default => false

    add_column :private_messages, :recipient_deleted, :boolean, :default => false

  end
end
