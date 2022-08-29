class CollocationsController < ApplicationController

  # Index and Show don't require a user to be logged in
  before_action :check_if_logged_in, except: [ :index, :show ]


  # CREATE
  def new
    @collocation = Collocation.new
  end

  def create
    
    @collocation = Collocation.new collocation_params
    @collocation.user_id = @current_user.id
    @collocation.save

    # if user tick garment checkbox
    if params[:garment_id].present?
      @collocation.garments << Garment.find(params[:garment_id])
    end # if params[:garment_id].present?
    
    
    # check if the collocation is saved correctly
    if @collocation.persisted?

      redirect_to collocations_path
    else
      render :new

    end # if @collocation.persisted?

  
  end # create

  # READ
  def index
    @collocations = Collocation.all
  end

  def show
    @collocation = Collocation.find params[:id]
  end

  # UPDATE
  def edit
    @collocation = Collocation.find params[:id]

    # Don't even show the edit form if the collocation doesn't belong to this user
    if @collocation.user_id != @current_user.id
      redirect_to login_path
    end # if

  end # edit

  def update
    @collocation = Collocation.find params[:id]

    # Check AGAIN that this collocation belongs to the logged-in user, 
    # since people can work out the edit URL
    if @collocation.user_id != @current_user.id
      redirect_to login_path
      return
    end # if


    if @collocation.update collocation_params
      # if no error, no rollback
      redirect_to collocation_path(@collocation.id)
    else
      render :edit
    end # if


  end # update

  # DESTROY
  def destroy
    Collocation.destroy params[:id]

    redirect_to collocations_path
  end

  
  private

  def collocation_params
    params.require(:collocation).permit(:title, :introduction, :image, :user_id)
  end


end # class CollocationsController
