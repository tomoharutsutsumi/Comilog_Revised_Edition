class Comic < ApplicationRecord
  has_many :likes
  belongs_to :user



  def liked?(user)
    Like.exists?(user_id: user, comic_id: self.id)
  end
end
