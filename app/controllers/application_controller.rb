class ApplicationController < ActionController::Base
    
    def current_user
        if @current_user
            @current_user
    end
    

end
