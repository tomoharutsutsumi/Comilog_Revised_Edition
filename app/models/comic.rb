class Comic < ApplicationRecord
  has_many :likes
  has_many :wants
  has_many :like_users, through: :likes, source: :user
  has_many :want_users, through: :wants, source: :user
  belongs_to :user

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :front_cover, presence: true
  validates :price, presence: true
  validates :day, presence: true
  validates :origin_title, presence: true

  mount_uploader :front_cover, FrontcoverUploader
  mount_uploader :content_first, FrontcoverUploader
  mount_uploader :content_second, FrontcoverUploader
  mount_uploader :content_third, FrontcoverUploader
  mount_uploader :content_fourth, FrontcoverUploader

  enum status:{nonreleased: 0, released: 1}
  enum category:{BL: 0, GL: 1, NL: 2, others: 3}

  def liked?(user)
    Like.exists?(user_id: user, comic_id: self.id)
  end

  def liked_by(user)
    user.likes.create(comic: self) unless liked?(user)
  end

  def wanted?(user)
    Want.exists?(user_id: user, comic_id: self.id)
  end

  def wanted_by(user)
    user.wants.create(comic: self) unless wanted?(user)
  end

  scope :all_rank_limit, -> { order('likes_count DESC').limit(3) }

  scope :rank_limit_by_day, -> { order('likes_count DESC').limit(10) }

  scope :sum_price, -> { sum(:price) }
end
