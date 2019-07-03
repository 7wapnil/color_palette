# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :fetch_user_by_id, only: [:create]

  def fetch_user_by_id
    @user = User.find_by(email: params[:session][:email])
  end

  def new; end

  def create
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You've logged in successfully"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Invalid user credentials please try again'
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:success] = "You've logged out successfully"
      redirect_to root_path
    else
      flash[:danger] = 'You have to login to perform this action'
      redirect_to login_path
    end
  end
end
