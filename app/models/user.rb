class User < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :museums, through: :visits
    has_many :comments
    validates :username, presence: true, uniqueness: true
    has_secure_password
    
    #list of museums wishlisted by current user
    def wishlisted_museums
        wishlist = self.visits.select { |visit| visit.visited == false }
        wishlist.map { |visit| visit.museum }
    end
    
    #list of museums actually visited by current user
    def visited_museums
        visited = self.visits.select { |visit| visit.visited == true }
        visited.map { |visit| visit.museum }
    end

    # lists all museums user has visited starting at the most recently visited
    def visited_by_date
        ordered_visits = self.visits.sort_by(&:updated_at).reverse
        ordered_visited = ordered_visits.select { |visit| visit.visited == true }
        ordered_visited.map { |visit| visit.museum }
    end

    # creates an array = [museums visited, 
    # number of museums put in wishlist, 
    # number of museums not visited]

    def not_visited
        Museum.all - self.wishlisted_museums - self.visited_museums
        # visited = self.visited_museums
        # visited_museum_ids = visited.map { |museum| museum.id }
        # wishlisted = self.wishlisted_museums
        # not_visited = Museum.where.not(id: visited_museum_ids)
        # objects_array = []
        # count_array = []
        # objects_array += [visited, wishlisted, not_visited] 
        # count_array += [visited.count, wishlisted.count, not_visited.count]
    end
 

    # creates array of all visits to museums 
    # by all users with the current user at the beginning
    def users_by_amount_visited
        user_visits = self.visited_museums.count
        other_user_visits = User.where.not(id: self.id).map { |user| user.visited_museums.count }
        other_user_visits.unshift(user_visits)
    end
    
end
