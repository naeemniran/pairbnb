class ListingsController < ApplicationController
  before_action :find_user
  
  def index
  	@listings = Listing.all
  end

  def new
  	@listing = current_user.listings.new
  end

  def create
  	@listing =  Listing.new(listing_params)
  	if @listing.save
  		redirect_to user_listing_path(@user, @listing)
  	end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
  	if @listing.update(listing_params)
  		flash[:success] = "Successfully updated the listing"
  		redirect_to user_listing_path(@user, @listing)
  	else
  		flash[:danger] = "Error updating listing"
  		render :edit
  	end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to user_path(@user)
  end

private 

  def listing_params
  	params.require(:listing).permit(:description, :title, :price)
  end

  def find_user 
    @user = User.find(params[:user_id])
  end

end
