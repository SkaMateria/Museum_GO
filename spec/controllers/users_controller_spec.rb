require 'rails_helper'

describe UsersController, type: :controller do

    it "renders the show template" do
        attributes =
        {
            username: "wilson",
            password: "password"
        } 
        user = User.create!(attributes)
        get :show, params: { id: user.id }
    render_template(:show)
    end

end