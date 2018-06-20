class Comic < ApplicationRecord
  has_many :likes
  belongs_to :user

  acts_as_taggable_on :tags

  mount_uploader :front_cover, FrontcoverUploader

  enum status:{nonreleased: 0, released: 1}

  def liked?(user)
    Like.exists?(user_id: user, comic_id: self.id)
  end


  def liked_by(user)
    user.likes.create(comic: self) unless liked?(user)
  end



  scope :sum_price, -> { sum(:price) }
end
