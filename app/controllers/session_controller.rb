class SessionController < ApplicationController

  # Login
  def new
  end

  def create

    # 1. Check that the email address entered is actually in the DB
    user = User.find_by email: params[:email]

    # 2. Did we actually find a user with that email address (or was it nil), 
    # AND if we did find a user, is the password entered the correct password for this email address?
    if user.present? && user.authenticate( params[:password] )
      # credentials are correct - successful login!

      # For every subsequent request from the browser, it will re-present cookie to the server as a request header
      session[:user_id] = user.id

      redirect_to root_path

    else
      # credentials are NOT correct
      
      # if reload the page again, the flash will be cleared and the error message will not appear again
      flash[:error] = 'Invalid email address or password'

      redirect_to login_path

    end # if

  end # create

  # Logout
  def destroy
    session[:user_id] = nil

    redirect_to login_path
  end
end


