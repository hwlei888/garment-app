class CollocationsController < ApplicationController

  # CREATE
  def new
    @collocation = Collocation.new
  end

  def create
    Collocation.create collocation_params

    redirect_to collocations_path
  end

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
