class Like < ApplicationRecord
  belongs_to :post
  belongs_to :likers, foreign_key: "liker_id", class_name: "User"
end
