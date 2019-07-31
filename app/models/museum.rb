class Museum < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :users, through: :visits

    has_many :comments
    # has_many :commenters, through: :comments, :class_name => "User"

    # lists users who have visited
    def visitors
        visited = self.visits.select { |visit| visit.visited == true }
        visited.map { |museum| museum.user }
    end
    
    # counts how many users have visited the museum
    def visitors_count
        self.visitors.count
    end
    
    # lists users who have wishlisted the museum
    def wishlisted
        wishlisted = self.visits.select { |visit| visit.visited == false }
        wishlisted.map { |museum| museum.user }
    end

    # counts how many users have wishlisted the museum
    def wishlisted_count
        self.wishlisted.count
    end
    
    # lists users who have not visited or added to wishlist
    def not_visitors
        User.all - self.users
    end

    # counts how many users have not visited or wishlisted the museum
    def not_visitors_count
        self.not_visitors.count
    end

    # lists only museums that have been visited
    def self.visited_museums
        Museum.all.map { |museum| museum.visits }.reject(&:empty?)
    end

    # counts the museums that have been visited
    def self.visited_museums_count
        Museum.visited_museums.count
    end

    # lists all museums that have not been visited or wishlisted
    def self.not_visited_museums
        Museum.all.map { |museum| museum.visits }.select(&:empty?)
    end

    # counts the museums that have not been visited
    def self.not_visited_museums_count
        Museum.not_visited_museums.count
    end
    
end