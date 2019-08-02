require 'rails_helper'

describe MuseumsController, type: :controller do

    it "renders the show template" do
        attributes =
        {
            name: "Museum of Stunning Paintings",
            address: "1234 Best St NW"
        } 
        museum = Museum.create!(attributes)
        get :show, params: { id: museum.id }
    render_template(:show)
    end

    it "renders comments on the show page" do
        
    end

end
    