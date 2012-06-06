class Search < ActiveRecord::Base
	has_many :users

def users
	@users ||= find_users
	end

#private

	def find_users
		User.find(:all, :conditions => conditions)
	end

def user_conditions
	["users.name LIKE ?", "%#{users}%"] unless users.blank?

end

def city_conditions
	["users.city LIKE ?", "%#{city}%"] unless city.blank?
end

#def skill_conditions
#	["users.skill LIKE ?", "%#{skills}%", "%#{skills}%"] unless skills.blank?
#end

def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  methods.grep(/_conditions$/).map { |m| send(m) }.compact
end


end
