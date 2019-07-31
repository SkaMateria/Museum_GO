class MuseumsController < ApplicationController

    def home
    end
        
    def index
        @museums = Museum.all
    end
    
    def show
        @museum = Museum.find(params[:id])
        @current_user = current_user
    end


    private

    def museum_params
        params.require(:museum).permit(:name)
    end
    
end
