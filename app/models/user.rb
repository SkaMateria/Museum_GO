class User < ApplicationRecord
    has_many :visits
    has_many :museums, through: :visits
    has_many :comments
    
    def wishlisted_museums
        wishlist = self.visits.select {|visit| visit.visited == false}
        wishlist.map { |visit| visit.museum }
    end
    
    def visited_museums
        #  self.
    end
end
