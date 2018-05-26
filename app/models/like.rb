class Like < ApplicationRecord
  belongs_to :comic, counter_cache: :likes_count
  belongs_to :user
end

