class Hashtag < ApplicationRecord
  has_many :hashtags_submissions, dependent: :destroy
  has_many :submissions, through: :hashtags_submissions
end
