class ApplicationController < ActionController::Base

    before_action :fetch_user

    def fetch_user
        # check if user is logged in
        if session[:user_id].present?
            @current_user = User.find_by id: session[:user_id]
        end # login check

        # force logout of invalid 'stale' ID
        unless @current_user.present?
            session[:user_id] = nil
        end

    end # fetch_user


    # If the current request (which could be any action of any controller)is coming from a user who is NOT logged in
    #redirect them to the login page
    def check_if_logged_in

        unless @current_user.present?
            flash[:error] = 'You must be logged in to perform that action'
            redirect_to login_path
        end #unless
        
    end # check_if_logged_in


end # class ApplicationController
