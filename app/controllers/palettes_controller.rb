# frozen_string_literal: true

class PalettesController < ApplicationController
  before_action :current_palette, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @palettes = current_user.palettes.paginate(page: params[:page])
  end

  def show; end

  def new
    @palette = current_user.palettes.new
  end

  def edit; end

  def create
    @palette = current_user.palettes.new(palette_params)
    if @palette.save
      flash[:success] = 'Your palette has been created successfully.'
      redirect_to palettes_path
    else
      render :new
    end
  end

  def update
    if @palette.update(palette_params)
      flash[:success] = 'Palette details updated successfully'
      redirect_to palettes_path
    else
      render :edit
    end
  end

  def destroy
    if @palette.destroy
      flash[:success] = 'Palette deleted successfully'
      redirect_to palettes_path
    else
      flash.now[:danger] = @palette.errors.full_messages.join('<br>').html_safe
      render :index
    end
  end

  def search
    @palettes = current_user.palettes
                            .where('name like ?', "%#{params[:keyword]}%")
                            .paginate(page: params[:page])
  end

  private

  def palette_params
    params.require(:palette).permit(
      :name,
      palette_colors_attributes: %i[id pallete_id color_id _destroy]
    )
  end

  def current_palette
    @palette = current_user.palettes.find(params[:id])
  end
end
