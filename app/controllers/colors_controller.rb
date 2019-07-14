# frozen_string_literal: true

class ColorsController < ApplicationController
  before_action :current_color, only: %i[show edit update destroy]
  before_action :authenticate_user!


  def index
    @colors = Color.paginate(page: params[:page])
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
      flash[:success] = 'Color details updated successfully'
      redirect_to colors_path
    else
      render :edit
    end
  end

  def destroy
    if @color.destroy
      flash[:success] = 'Color deleted successfully'
      redirect_to colors_path
    else
      flash.now[:danger] = @color.errors.full_messages.join('<br>').html_safe
      render :index
    end
  end

  def search
    @colors = Color.all
                   .where('name like ?', "%#{params[:keyword]}%")
                   .paginate(page: params[:page])
  end

  private

  def color_params
    params.require(:color).permit(:name, :hex_code)
  end

  def current_color
    @color = Color.find(params[:id])
  end
end
