class Section < ActiveRecord::Base
	has_many :topics, :dependent => :destroy

	validates :title, :description, :presence => true

end
