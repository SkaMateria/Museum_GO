class Visit < ApplicationRecord
    belongs_to :user
    belongs_to :museum
    validates :user_id, uniqueness: { scope: :museum_id }

    # collects all instances of museums that have been 
    # either visited or wishlisted
    def self.visited_museums
        self.all.map { |visit| visit.museum }
    end

end
