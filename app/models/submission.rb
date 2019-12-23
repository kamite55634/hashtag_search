class Submission < ApplicationRecord
  has_many :hashtags_submissions, dependent: :destroy
  has_many :hashtags, through: :hashtags_submissions
end
