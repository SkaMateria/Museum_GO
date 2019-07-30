class MuseumsController < ApplicationController

    def index
        @museums = Museum.all
    end
    
    def show
        @museum = Museum.find(params[:id])
    end

    private

    def museum_params
        params.require(:museum).permit(:name)
    end
    
end
