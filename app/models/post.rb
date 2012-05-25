class Post < ActiveRecord::Base
	belongs_to :topic
	belongs_to :user
	validates :subject, :message, :presence => true
end
