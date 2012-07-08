class PrivateMessage < ActiveRecord::Base
	attr_accessible :pm_attachment, :sender, :recipient, :subject, :message
	has_attached_file :pm_attachment
end
