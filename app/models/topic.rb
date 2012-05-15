class Topic < ActiveRecord::Base
	belongs_to :section
	belongs_to :user
	has_many :posts

	validates :title, :presence => true

end
