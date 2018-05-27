class Comic < ApplicationRecord
  has_many :likes
  belongs_to :user

  mount_uploader :front_cover, FrontcoverUploader
  mount_uploader :content_first, ContentfirstUploader
  mount_uploader :content_second, ContentsecondUploader
  mount_uploader :content_third, ContentthirdUploader
  mount_uploader :content_fourth, ContentfourthUploader

  enum status:{nonreleased: 0, released: 1}

  def liked?(user)
    Like.exists?(user_id: user, comic_id: self.id)
  end


  def liked_by(user)
    user.likes.create(comic: self) unless liked?(user)
  end



  scope :sum_price, -> { sum(:price) }
end
