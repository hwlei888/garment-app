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
  end

  def update
    collocation = Collocation.find params[:id]

    collocation.update collocation_params

    redirect_to collocation_path(collocation.id)
  end

  # DESTROY
  def destroy
    Collocation.destroy params[:id]

    redirect_to collocations_path
  end

  
  private

  def collocation_params
    params.require(:collocation).permit(:title, :introduction, :image)
  end


end # class CollocationsController
