class User < ApplicationRecord
    has_many :visits
    has_many :museums, through: :visits
    has_many :comments
    validates :username, presence: true, uniqueness: true
    has_secure_password
    
    def wishlisted_museums
        wishlist = self.visits.select { |visit| visit.visited == false }
        wishlist.map { |visit| visit.museum }
    end
    
    def visited_museums
        visited = self.visits.select { |visit| visit.visited == true }
        visited.map { |visit| visit.museum }
    end
end
