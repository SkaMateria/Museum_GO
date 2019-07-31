class User < ApplicationRecord
    has_many :visits, dependent: :destroy
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

    #lists all museums user has visited starting at the most recently visited
    def visited_by_date
        ordered_visits = self.visits.sort_by(&:updated_at).reverse
        ordered_visited = ordered_visits.select { |visit| visit.visited == true }
        ordered_visited.map { |visit| visit.museum }
    end

    #creates an array = [number of museums visited, number of museums put in wishlist, number of museums not visited]
    def user_visited_wishlisted_not_visited
        visit_count = self.visited_museums.count
        wishlist_count = self.wishlisted_museums.count
        not_visited_count = Museum.all.count - visit_count
        array = []
        array += [visit_count, wishlist_count, not_visited_count]
        array
    end

    #creates array of all visits to museums by all users with the current user at the beginning
    def users_by_amount_visited
        user_visits = self.visited_museums.count
        other_user_visits = User.where.not(id: self.id).map { |user| user.visited_museums.count }
        other_user_visits.unshift(user_visits)
    end


end
