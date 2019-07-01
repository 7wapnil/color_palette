class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notification] = "User is been created successfully.!"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:notification] = "User details updated successfully"
      redirect_to root_path
    else
      render  :new
    end
  end
  
  def login
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end