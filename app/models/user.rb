class User < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :museums, through: :visits
    has_many :comments
    validates :username, presence: true, uniqueness: true
    has_secure_password
    
    # list of museums actually visited by current user
    def visited_museums
        visited = self.visits.select { |visit| visit.visited == true }
        visited.map { |visit| visit.museum }
    end

    def visited_museums_count
        self.visited_museums.count
    end
    
    # list of museums wishlisted by current user
    def wishlisted_museums
        wishlist = self.visits.select { |visit| visit.visited == false }
        wishlist.map { |visit| visit.museum }
    end

    def wishlisted_museums_count
        self.wishlisted.count
    end
    
    # list of museums you have not visited or wishlisted
    def not_visited
        Museum.all - self.wishlisted_museums - self.visited_museums
    end

    def not_visited_count
        self.not_visited.count
    end

    # list of all comments starting from most recent
    def comments_history
        self.comments.map { |comment| comment.content }.reverse
    end

    def comments_history_count
        self.comments_history.count
    end
    
    # lists all museums user has visited starting at the most recently visited
    def visited_by_date
        ordered_visits = self.visits.sort_by(&:updated_at).reverse
        ordered_visited = ordered_visits.select { |visit| visit.visited == true }
        ordered_visited.map { |visit| visit.museum }
    end

 
    # creates array of all visits to museums 
    # by all users with the current user at the beginning
    def users_by_amount_visited
        user_visits = self.visited_museums.count
        other_user_visits = User.where.not(id: self.id).map { |user| user.visited_museums.count }
        other_user_visits.unshift(user_visits)
    end
    
end
