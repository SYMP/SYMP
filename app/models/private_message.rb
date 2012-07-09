class PrivateMessage < ActiveRecord::Base
	attr_accessible :pm_attachment, :sender, :recipient, :subject, :message, :unread
	has_attached_file :pm_attachment
end
