class Section < ActiveRecord::Base
	has_many :topics

	validates :title, :description, :presence => true

end
