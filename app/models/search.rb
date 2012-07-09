class Search < ActiveRecord::Base
	has_many :users

def users
	@users ||= find_users
	end

end
