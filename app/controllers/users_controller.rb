#all this comes from routes.rb via resiur
class UsersController < Clearance::UsersController
	
  	def index
  		@users = User.all
  	end

  	def show
  		@user = User.find(params[:id])
  	end

  	def new
  		@user = User.new
  	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to user_path(@user)
		else
			flash[:error] = "Sign Up Not Successful"
			render :new
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		sign_out
		redirect_to root_path
	end

	private

#strong params to disallow hacking eg: admin: false change to true epxlianed by Kevin
	def user_params
		params.require(:user).permit(:email, :password, :name)
	end
end