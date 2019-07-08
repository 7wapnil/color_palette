class PalettesController < ApplicationController
  def index
    @palettes = Palette.all
  end

  def show
    @palette = Palette.find(params[:id])
  end

  def new
    @palette = Palette.new
  end

  def edit
    @palette = Palette.find(params[:id])
    # Color.all.each { |color| @palette.colors.build() }
  end

  def create
    @palette = Palette.new(palette_params)
    if @palette.save
      flash[:success] = "Your palette has been created successfully."
      redirect_to palettes_path
    else
      flash.now[:danger] = @palette.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def update
    @palette = Palette.find(params[:id])
    if @palette.update(palette_params)
      flash[:success] = "palette details updated successfully"
      redirect_to palettes_path
    else
      render :edit
    end
  end

  def destroy
    @palette = Palette.find(params[:id])
    if @palette.delete
      flash[:success] = "Palette deleted successfully"
      redirect_to palettes_path
    else
      flash.now[:danger] =  @palette.errors.full_messages.join("<br>").html_safe
      render :index
    end
  end

  private

  def palette_params
    params.require(:palette).permit(
      :name,
      palette_colors_attributes: [:id, :pallete_id, :color_id, :_destroy]
    )
  end
end