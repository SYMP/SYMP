class AddAttachmentPmAttachmentToPrivateMessages < ActiveRecord::Migration
  def self.up
    add_column :private_messages, :pm_attachment_file_name, :string
    add_column :private_messages, :pm_attachment_content_type, :string
    add_column :private_messages, :pm_attachment_file_size, :integer
    add_column :private_messages, :pm_attachment_updated_at, :datetime
  end

  def self.down
    remove_column :private_messages, :pm_attachment_file_name
    remove_column :private_messages, :pm_attachment_content_type
    remove_column :private_messages, :pm_attachment_file_size
    remove_column :private_messages, :pm_attachment_updated_at
  end
end
