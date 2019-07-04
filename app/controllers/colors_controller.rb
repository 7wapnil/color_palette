class ColorsController < ApplicationController
  
  def index
    @colors = Color.all
  end

  def show
    @color = Color.find(params[:id])
  end

  def new
    @color = Color.new
  end

  def edit
    @color = Color.find(params[:id])
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      flash[:success] = 'Color created successfully'
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @color = Color.find(params[:id])
    if @color.update(color_params)
      flash[:success] = "Color details updated successfully"
      redirect_to colors_path
    else
      render :edit
    end
  end

  def destroy
    @color = Color.find(params[:id])
    @color.delete
    redirect_to colors_path 
  end

  private

  def color_params
    params.require(:color).permit(:name, :hex_code)
  end
end