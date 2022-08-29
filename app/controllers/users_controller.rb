class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new, :create, :index, :show]

  # Sign up
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    # Check if @user.id != nil if we create an object saved into the DB
    if @user.persisted?
      # after sign up, login automatically
      session[:user_id] = @user.id 
      redirect_to user_path(@user.id)
    else

      # we render again the 'new' template, which includes the error messages from the AR validation process
      render :new

    end # if

  end # create

  
  # Read
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end


  # Update
  def edit
    @user = User.find params[:id]
    
    if @user.id != @current_user.id
      redirect_to login_path
    end # if
    
  end # edit
  
  def update
    
    @user = User.find params[:id]

    if @user.id != @current_user.id
      redirect_to login_path
    end # if

    if @user.update user_params
      redirect_to user_path(@user.id)
    else
      render :edit
    end # if


  end # update


  # Destroy
  def destroy
    User.destroy params[:id]

    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end




end # class UsersController


