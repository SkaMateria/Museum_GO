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
        #retrieves the currently logged in user's id and sets that to user_id
        user_id = current_user.id
        #retrieves the museum's id chosen via the corresponding delete button and sets that to museum_id
        museum_id = params[:id].to_i
        #searches the visits table for the correct visit that matches with the user id and museum id and sets it visit 
        visit = current_user.visits.where(user_id: user_id, museum_id: museum_id).first
        visit.destroy
        redirect_to user_path(current_user)
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :museum_id, :visited)
    end
end
