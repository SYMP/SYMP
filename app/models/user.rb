class User < ActiveRecord::Base
	has_many :topics
	has_many :posts
	has_many :skills, :dependent => :destroy # if user will be deleted, the skills will be destroy
	#has_one  :birthdate
	#has_one  :city
	#has_one  :pw_hash

	acts_as_authentic do |config|
	  config.crypto_provider = Authlogic::CryptoProviders::MD5
	end
end
