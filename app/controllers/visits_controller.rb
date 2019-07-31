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
        user_id = current_user.id
        museum_id = params[:id].to_i
        visit_id = current_user.visits.where(user_id: user_id, museum_id: museum_id)
        visit_id.first.destroy
        redirect_to user_path(current_user)
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :museum_id, :visited)
    end
end
