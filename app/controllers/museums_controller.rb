class MuseumsController < ApplicationController

    def home
    end
        
    def index
        @museums = if params[:term] 
            Museum.where('name LIKE ?', "%#{params[:term]}%")
        else
            Museum.all 
        end
    end
    
    def show
        @museum = Museum.find(params[:id])
        @current_user = current_user
    end

    def search
        @museums = Museum.search(search_params)
        byebug
        render :index
    end

    private

    def museum_params
        params.require(:museum).permit(:name, :term)
    end
    
end
