class Comic < ApplicationRecord
  has_many :likes
  belongs_to :user

  validates :title, presence: true
  validates :front_cover, presence: true
  validates :price, presence: true
  validates :day, presence: true
  validates :origin_title, presence: true


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
