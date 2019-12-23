class Submission < ApplicationRecord
  has_many :hashtags_submissions, dependent: :destroy
  has_many :hashtags, through: :hashtags_submissions

  def self.search(search)
    if search && search != ""
      hashtags = []
      words = search.split(/[[:blank:]]+/)
      words.each do |word|
        hashtag = Hashtag.find_by("name like ? ", "%#{word}%")
        if hashtag
          hashtags.push(hashtag.submissions)
        end
      end
      $notice = "#{words}の検索結果を表示しています"
      return hashtags.flatten.uniq!
    else
      $notice = "全ての投稿を表示しています"
      return Submission.all
    end
  end
end
