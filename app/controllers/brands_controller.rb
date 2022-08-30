class BrandsController < ApplicationController

  # CREATE
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create brand_params

    if @brand.persisted?
      redirect_to brands_path
    else
      render :new
    end # if

  end # create

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
    @brand = Brand.find params[:id]

    if @brand.update brand_params
      redirect_to brand_path(@brand.id)
    else
      render :edit
    end # if

  end # update

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


