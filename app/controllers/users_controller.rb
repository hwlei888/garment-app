class UsersController < ApplicationController

  # Sign up
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    # Check if @user.id != nil if we create an object saved into the DB
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else

      # we render again the 'new' template, which includes the error messages from the AR validation process
      render :new

    end # if

  end # create

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end




end # class UsersController


