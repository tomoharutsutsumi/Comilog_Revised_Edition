class Like < ApplicationRecord
  belongs_to :comic
  belongs_to :user
end
