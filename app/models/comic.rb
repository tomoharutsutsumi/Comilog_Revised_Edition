class Comic < ApplicationRecord
  has_many :likes
  belongs_to :user

  enum status:{release: 0, nonrelease: 1}

  def liked?(user)
    Like.exists?(user_id: user, comic_id: self.id)
  end


  def liked_by(user)
    user.likes.create(comic: self) unless liked?(user)
  end
end
