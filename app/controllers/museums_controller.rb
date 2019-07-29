class MuseumsController < ApplicationController

    def index
        @museums = Museum.all
    end
    
    def show
        @museum = Museum.find_by(params[:id])
    end
    
end
