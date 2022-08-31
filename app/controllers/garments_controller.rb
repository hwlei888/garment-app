class GarmentsController < ApplicationController

  # CREATE #################################################
  def new
    @garment = Garment.new
  end

  def create

    @garment = Garment.create garment_params

    # if user tick garment checkbox
    if params[:occasion_ids].present?
      # like what we do in seeds.rb
      # o1.garments << g1 << g3 << g4 << g5 << g6
      @garment.occasions << Occasion.find(params[:occasion_ids])
    end # if params[:occasion_ids]


    # if @garment.id != nil
    if @garment.persisted?
      redirect_to garments_path
    else
      render :new
    end # if @garment

  end # create


  # READ #################################################
  def index
    @garments = Garment.all
  end

  # i.e. GET /garments/:id
  def show
    @garment = Garment.find params[:id]

    @comment = Comment.new # Connect comment in garment show page at here!!!!!!!

  end

  # UPDATE #################################################
  def edit
    @garment = Garment.find params[:id]
  end

  def update
    @garment = Garment.find params[:id]

    # if user tick garment checkbox in edit
    if params[:occasion_ids].present?
      @garment.occasions.destroy_all
      @garment.occasions << Occasion.find(params[:occasion_ids])
    end


    # in case there is an error and rollback
    if @garment.update garment_params
      redirect_to garment_path(@garment.id)
    else
      render :edit
    end # if

  end # update

  # DESTROY #################################################
  def destroy
    Garment.destroy params[:id]
    
    redirect_to garments_path
  end


  private

  def garment_params
    params.require(:garment).permit(:name, :price, :fabrication, :image, :brand_id)
  end







end # class GarmentsController




