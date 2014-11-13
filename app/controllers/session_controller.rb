class SessionController < ApplicationController
    # skip_before_filter :authorize

    def new
    end

    def create
        # Find the user that is trying to log in        
        u = User.where(email: params[:email]).first
        puts u.inspect
        if u && u.authenticate(params[:password])
            # Store as a cookie in the users' browser the ID of them,
            # indicating that they are logged in
            session[:user_id] = u.id.to_s
            redirect_to restaurants_path
        else
            # Go back to the login page
            redirect_to login_path
        end
    end

    def destroy
        reset_session
        redirect_to restaurants_path
    end
end