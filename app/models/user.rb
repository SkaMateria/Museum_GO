class User < ApplicationRecord
    has_many :visits
    has_many :museums, through: :visits
 
    has_many :comments
    # has_many :commented_museums, through: :comments, :source => "Museum"
end
