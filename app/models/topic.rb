class Topic < ActiveRecord::Base
	belongs_to :section
	belongs_to :user
	has_many :posts, :dependent => :destroy

	validates :title, :presence => true

end
