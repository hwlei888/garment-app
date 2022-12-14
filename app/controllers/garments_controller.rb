class GarmentsController < ApplicationController

  # CREATE #################################################
  def new
    @garment = Garment.new
  end

  def create

    # raise "hell"

    @garment = Garment.new garment_params

    if params[:garment][:image].present?
      response = Cloudinary::Uploader.upload params[:garment][:image]
      @garment.image = response["public_id"]
    end

    @garment.save

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


  def like
    # raise "hell"

    @garment = Garment.find params[:id]

    unless @garment.like_from_users.include?(@current_user)
      @garment.like_from_users << @current_user
    else
      @garment.like_from_users.delete(@current_user) 
    end # unless
    # render :show # don't do this! it will go to garments/:id/like, and routes will mess up
    redirect_to garment_path(@garment)

  end # like


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

    # need to delete :image in def garment_params, or the re-upload will not work
    if params[:garment][:image].present?
      response = Cloudinary::Uploader.upload params[:garment][:image]
      @garment.image = response["public_id"]
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

  #ILKE: case-insensitive
  def search
    if params[:search].blank?
      redirect_to garments_path
      return
    else
      # @results = Garment.all.where("lower(name) LIKE :search", search: "%#{params[:search]}%")
      @match_garments = Garment.where("name ILIKE ?", "%#{params[:search]}%")
      @match_brands = Brand.where("name ILIKE ?", "%#{params[:search]}%")
      @match_garment_occasions = Garment.joins(:occasions).where("title ILIKE ?", "%#{params[:search]}%")

      
      # We can write like this when in rb file have def self.search(search)
      # @match_garments = Garment.search(params[:search])
      # @match_brands = Brand.search(params[:search])
    end

  end


  private

  def garment_params
    params.require(:garment).permit(:name, :price, :fabrication, :brand_id)
  end







end # class GarmentsController




