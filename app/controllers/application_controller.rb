class ApplicationController < ActionController::Base
    
    helper_method :current_user 
    helper_method :current_username

    def current_user
        if @current_user
            @current_user
        else
            @current_user = User.find_by(id: session[:user_id])
        end
    end

    def current_username
        if current_user
            @current_user.username
        else
            nil
        end
    end
    

end
