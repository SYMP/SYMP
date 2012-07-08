class User < ActiveRecord::Base
	attr_accessible :name, :email, :birthdate, :city, :password, :password_confirmation, :avatar
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	has_many :topics
	has_many :posts
	has_many :skills, :dependent => :destroy # if user will be deleted, the skills will be destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
 	has_many :followed_users, through: :relationships, source: :followed	
	has_many :followers, through: :reverse_relationships, source: "follower_id"

#implementing user.followers using reverse relationships
 	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy

	has_many :followers, through: :reverse_relationships, source: :follower                                   
	acts_as_authentic do |config|
	  config.crypto_provider = Authlogic::CryptoProviders::MD5
	end

	def role
	  role = Role.where('user_id = ?', id)[0]
	  if role == nil
	  	return "User"
	  end
	  rolestring = case role.role
        when 0 then "Administrator"
        when 1 then "Moderator"
        else "User"
      end
	end


	def following?(other_user)
    	relationships.find_by_followed_id(other_user.id)
  	end 

  	def follow!(other_user)
    	relationships.create!(followed_id: other_user.id)
  	end

  	def unfollow!(other_user)
    	relationships.find_by_followed_id(other_user.id).destroy
  	end

	def unread_messages
      PrivateMessage.where('recipient = ? AND unread = ?', id, true).count
    end
end