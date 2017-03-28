class ListingsController < ApplicationController
  
  def index
  	@listings = Listing.all
  end

  def new
    byebug
  	@listing = current_user.listing.new
  end

  def create
  	@listing =  Listing.new(listing_params)
  	if @listing.save
  		redirect_to listings_path
  	end
  end

  def show
  end

  def edit
    
  end

  def update
  	if @listing.update(listing_params)
  		flash[:success] = "Successfully updated the listing"
  		redirect_to @listing
  	else
  		flash[:danger] = "Error updating listing"
  		render :edit
  	end
  end


private 

  def listing_params
  	params.require(:listing).permit(:description, :title, :price)
  end


end
