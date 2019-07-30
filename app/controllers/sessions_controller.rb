class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user 
            session[:user_id] = @user.id
            redirect_to museums_path                                                                                        
        else 
            flash[:notice] = "No username found"
            render :new
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to museums_path
    end

end