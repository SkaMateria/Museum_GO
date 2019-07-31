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
    
    def not_visitors
        User.all - self.users
    end

    def not_visitors_count
        self.not_visitors.count
    end

    def self.visited_museums
        Museum.all.map { |museum| museum.visits }.reject(&:empty?)
    end

    def self.visited_museums_count
        Museum.visited_museums.count
    end

    def self.not_visited_museums
        Museum.all.map { |museum| museum.visits }.select(&:empty?)
    end

    def self.not_visited_museums_count
        Museum.not_visited_museums.count
    end

    #creates an array where the current museum is first 
    # and any other museum with visits follows in an effort to compare
    def compared_to_other_museums
        museum_visits = self.visits
        other_museum_visits = Museum.where.not(id: self.id).map { |museum| museum.visits }.reject(&:empty?)
        all_museum_visits = []
        all_museum_visits += [museum_visits, other_museum_visits]
        all_museum_visits
    end 

end