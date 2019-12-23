class HashtagsSubmission < ApplicationRecord
  belongs_to :hashtag
  belongs_to :submission
end
