class Post < ApplicationRecord
  belongs_to :user

  validates :title, 
        presence: true, 
        length: { in: 5..50, too_long: "Tile should be at most 50 characters long.", too_short: "Title should be at least 5 characters long." }

    validates :body, 
        presence: true, 
        length: { minimum: 10, too_long: "The post should be at least 10 characters long."}
end
