class SessionsController < ApplicationController 
  protect_from_forgery

  def new 
    @user = User.new
    render :new
  end 

  def create 
    @user = User.find_by_credentials( 
      params[:user][:email], 
      params[:user][:password]
    )
    if @user
      log_in_user!(@user)

      redirect_to bands_url
    else
      render json: "Not valid credentials"
    end
  end 

  def destroy 
      logout!
      redirect_to new_user_url
  end 

end 