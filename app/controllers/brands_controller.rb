class BrandsController < ApplicationController

  # CREATE
  def new
    @brand = Brand.new
  end

  def create
    Brand.create brand_params

    redirect_to brands_path
  end

  # READ
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find params[:id]
  end

  # UPDATE
  def edit
    @brand = Brand.find params[:id]
  end

  def update
    brand = Brand.find params[:id]

    brand.update brand_params

    redirect_to brand_path(brand.id)
  end

  # DESTROY
  def destroy
    Brand.destroy params[:id]

    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :country, :introduction)
  end

  
end # class BrandsController


