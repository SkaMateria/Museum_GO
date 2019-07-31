class VisitsController < ApplicationController
    
    def create
        visit = Visit.new(visit_params)

        if visit.valid?
            Visit.create(visit_params)
            redirect_to user_path(visit.user)
        else 
            Visit.update(visit_params)
            redirect_to user_path(visit.user)
        end

    end

    def destroy
        Visit.destroy(params[:id])
        redirect_to user_path(current_user)
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :museum_id, :visited)
    end

end
