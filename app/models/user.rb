class User < ActiveRecord::Base
	has_many :topics
	has_many :posts

	acts_as_authentic do |config|
      config.crypto_provider = Authlogic::CryptoProviders::MD5
    end # the configuration block is optional
end
