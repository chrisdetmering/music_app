class AlbumsController < ApplicationController 
  protect_from_forgery
  
  
  def new 
    @album = Album.new 
    @band = Band.find(params[:band_id])
    render :new
  end 

  def create 
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render json: @album.errors.full_messages
    end
  end 

  def show 
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: params[:band_id])
  end 

  def edit 
    @album = Album.find_by(id: params[:id])
    render :edit
  end 

  def update 
    @album = Album.find_by(id: params[:id])
  end 

  def destroy 
  end 

  private 

  def album_params 
    params.require(:album).permit(:name, :year, :live, :band_id)
  end 
end 