class ColorsController < ApplicationController

  before_action :current_color, only: [:show, :edit, :update, :destroy]
  
  def index
    @colors = Color.paginate(page: params[:page], per_page: 4)
  end

  def show; end

  def new
    @color = Color.new
  end

  def edit; end

  def create
    @color = Color.new(color_params)
    if @color.save
      flash[:success] = 'Color created successfully'
      redirect_to colors_path
    else
      render :new
    end
  end

  def update
    if @color.update(color_params)
      flash[:success] = "Color details updated successfully"
      redirect_to colors_path
    else
      render :edit
    end
  end

  def destroy
    @color.delete
    redirect_to colors_path 
  end

  private

  def color_params
    params.require(:color).permit(:name, :hex_code)
  end

  def current_color
    @color = Color.find(params[:id])
  end
end