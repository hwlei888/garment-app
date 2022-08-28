class CollocationsController < ApplicationController

  # CREATE
  def new
  end

  def create
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
  end

  def update
  end

  # DESTROY
  def destroy
  end




end # class CollocationsController
