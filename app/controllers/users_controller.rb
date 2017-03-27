#all this comes from routes.rb via resiur
class UsersController < Clearance::UsersController
	
  	def index
  		@users = User.all
  	end

  	def show
  		@user = User.find(user_params)
  	end

  	def new
  		@user = User.new
  	end

	def edit
		@user = User.find(user_params)
	end

	def update

	end

	def create

	end

	def delete

	end

	private

#strong params to disallow hacking eg: admin: false change to true epxlianed by Kevin
	def user_params
		params.require(:user).permit(:email, :password)
	end
end