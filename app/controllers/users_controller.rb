class UsersController < ApplicationController 
   protect_from_forgery
  
  
  def new 
    @user = User.new
    render :new
  end 

  def create 
    @user = User.new(user_params)
    
    if @user.save
      log_in_user!(@user)
      redirect_to bands_url
    else
      render json: 'User not valid'
    end

  end 

  def show 
    @user = User.find_by(id: params[:id])
    render :show
  end 

  private 

  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end 