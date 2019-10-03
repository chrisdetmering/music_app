class BandsController < ApplicationController 
  protect_from_forgery
  
  def index 
    @user = current_user
  end 



  def new 
    @band = Band.new 
    render :new 
  end 

  def create 
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else 
      render json: @band.errors.full_messages
    end 

  end 

  def show 
    @band = Band.find_by(id: params[:id])
    @albums = albums
    render :show
  end 

  def destroy 
    @band = Band.find_by(id: params[:id])
   
   if @band.delete
    redirect_to bands_url
   else 
    render json: @band.errors.full_messages
   end 
  end 

  def edit 
    @band = Band.find_by(id: params[:id])
    
    render :edit
  end 

  def update 
    @band = Band.find_by(id: params[:id])
    @band.update(name: band_params[:name])

   if @band.save!
    redirect_to band_url(@band)
   else 
    render json: @band.errors.full_messages
   end 

  end 

  private 
  def band_params 
    params.require(:band).permit(:name)
  end 

  def albums 
    Album
    .where(band_id: params[:id])
  end 

end 