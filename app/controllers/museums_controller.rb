class MuseumsController < ApplicationController

    before_action :authorized, except: [:home, :index, :show]

    def home
    end
        
    def index
        @museums = if params[:term]
            Museum.where('name LIKE ?', 
                "%#{params[:term]}%")
            else
                Museum.all 
    end
    
    def show
        @museum = Museum.find(params[:id])
        @current_user = current_user
    end

    private

    def museum_params
        params.require(:museum).permit(:name, :term)
    end
    
end
