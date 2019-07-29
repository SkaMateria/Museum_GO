class Museum < ApplicationRecord
    has_many :visits
    has_many :users, through: :visits

    has_many :comments
    # has_many :commenters, through: :comments, :class_name => "User"

    # lists users who have visited
    def visitors 
    end

    # lists users who have wishlisted the museum
    def wishlist
    end

    # counts how many users have visited the museum
    def visitor_count
    end

    # counts how many users have wishlisted the museum
    def wishlist_count
    end

    # list comments

    # count comments
    
end
