class UserSession < Authlogic::Session::Base
  	attr_accessor :login, :password
	def to_key
		[session_key]
	end
end
