class OccasionsController < ApplicationController

  # CREATE
  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = Occasion.create occasion_params

    if @occasion.persisted?
      redirect_to occasions_path
    else
      render :new
    end # if

  end # create

  # READ
  def index
    @occasions = Occasion.all
  end

  def show
    @occasion = Occasion.find params[:id]
  end

  # UPDATE
  def edit
    @occasion = Occasion.find params[:id]
  end

  def update
    occasion = Occasion.find params[:id]

    occasion.update occasion_params

    redirect_to occasion_path(occasion.id)
  end

  # DESTROY
  def destroy
    Occasion.destroy params[:id]

    redirect_to occasions_path
  end


  private
  
  def occasion_params
    params.require(:occasion).permit(:title)
  end



end # class OccasionsController


