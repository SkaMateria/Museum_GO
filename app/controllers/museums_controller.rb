class MuseumsController < ApplicationController

    before_action :authorized, except: [:home, :index, :show]

    def home
    end
    
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
