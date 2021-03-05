class Url < ApplicationRecord
  scope :top_100, -> { order(count: :desc).limit(100) }
end
