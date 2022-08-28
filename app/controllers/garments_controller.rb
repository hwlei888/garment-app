class GarmentsController < ApplicationController

  # CREATE
  def new
    @garment = Garment.new
  end

  def create
    Garment.create garment_params

    redirect_to garments_path
  end


  # READ 
  def index
    @garments = Garment.all
  end

  # i.e. GET /garments/:id
  def show
    @garment = Garment.find params[:id]
  end

  # UPDATE
  def edit
    @garment = Garment.find params[:id]
  end

  def update
    garment = Garment.find params[:id]

    garment.update garment_params

    redirect_to garment_path(garment.id)
  end

  # DESTROY
  def destroy
    Garment.destroy params[:id]
    
    redirect_to garments_path
  end


  private

  def garment_params
    params.require(:garment).permit(:name, :price, :fabrication, :image, :brand_id)
  end







end # class GarmentsController




