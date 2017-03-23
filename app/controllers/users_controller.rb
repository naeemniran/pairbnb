#all this comes from routes.rb via resiur
class UsersController < Clearance::UsersController
	
  	def index
  	end

	def edit
	end

	def update
	end

	private

#strong params to disallow hacking eg: admin: false change to true epxlianed by Kevin
	def user_params
		params.require(:user).permit(:email, :password)
	end
end