class VisitsController < ApplicationController
    
    def create
        visit = Visit.find_or_create_by(visit_params)
        redirect_to museum_path(visit.museum)
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :museum_id, :visited)
    end

end
