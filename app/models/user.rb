class User < ApplicationRecord
	include Clearance::User

  has_many :listings
 
  has_many :authentications, dependent: :destroy

 	def self.create_with_auth_and_hash(authentication, auth_hash)
      	user = User.create!(name: auth_hash[:info][:name], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(6))
      	user.authentications << (authentication) 
      	return user
  	end

  	def fb_token
    	x = self.authentications.where(:provider => :facebook).first
    	return x.token unless x.nil?
  	end

end
