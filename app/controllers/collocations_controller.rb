class CollocationsController < ApplicationController

  # Index and Show don't require a user to be logged in
  before_action :check_if_logged_in, except: [ :index, :show ]


  # CREATE #################################################
  def new
    @collocation = Collocation.new
  end

  def create
    # raise "hell"
    
    @collocation = Collocation.new collocation_params
    @collocation.user_id = @current_user.id
    @collocation.save

    # if user tick garment checkbox
    if params[:garment_id].present?
      @collocation.garments << Garment.find(params[:garment_id])
    end # if params[:garment_id].present?


    # User can add as many photos as they want
    if params[:photo_links].present?
      photo_links = params[:photo_links]
      photo_links.each do |pic|
        @collocation.photos << Photo.create(image: pic)
      end
    end


    
    # check if the collocation is saved correctly
    if @collocation.persisted?

      redirect_to collocations_path
    else
      render :new

    end # if @collocation.persisted?

  
  end # create

  # READ #################################################
  def index
    @collocations = Collocation.all
  end

  def show
    @collocation = Collocation.find params[:id]
  end






  # UPDATE #################################################
  def edit
    
    @collocation = Collocation.find params[:id]

    # Don't even show the edit form if the collocation doesn't belong to this user
    if @collocation.user_id != @current_user.id
      redirect_to login_path
    end # if

  end # edit

  def update
    # raise "hell"

    @collocation = Collocation.find params[:id]

    # Check AGAIN that this collocation belongs to the logged-in user, 
    # since people can work out the edit URL
    if @collocation.user_id != @current_user.id
      redirect_to login_path
      return
    end # if

    # if user tick garment checkbox in edit
    if params[:garment_id].present?
      @collocation.garments.destroy_all
      @collocation.garments << Garment.find(params[:garment_id])
    end # if params[:garment_id].present?


    # the photos they add before, edit or not
    # check if it has photos or not before edit first
    if @collocation.photos.present?
      @collocation.photos.each do |photo|
        photo_id = photo.id.to_s # 16 -> "16"
        photo.update(image: params[photo_id]) 
        # photo_id is a hash, :key or "key"
      end
    end
      
    # User can add new photos in edit
    if params[:photo_links].present?
      photo_links = params[:photo_links]
      photo_links.each do |pic|
        @collocation.photos << Photo.create(image: pic)
      end
    end



    if @collocation.update collocation_params
      # if no error, no rollback
      redirect_to collocation_path(@collocation.id)
    else
      render :edit
    end # if


  end # update





  # DESTROY #################################################
  def destroy
    Collocation.destroy params[:id]

    redirect_to collocations_path
  end

  
  private

  def collocation_params
    params.require(:collocation).permit(:title, :introduction, :image, :user_id)
  end


end # class CollocationsController
