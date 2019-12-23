class Submission < ApplicationRecord
  has_many :hashtags_submissions, dependent: :destroy
  has_many :hashtags, through: :hashtags_submissions

  def self.search(search)
    if search && search != ""
      submissions_first = []
      words = search.split(/[[:blank:]]+/)
      words.each do |word|
        hashtag = Hashtag.find_by("name like ? ", "%#{word}%")
        if hashtag && submissions_first == []
          submissions_first.push(hashtag.submissions)

        elsif hashtag
          submissions_second = []
          submissions_second.push(hashtag.submissions)
          submissions_first = submissions_second.flatten & submissions_first.flatten
        end

      end
      $notice = "#{words}の検索結果を表示しています"
      return submissions_first.flatten
    else
      $notice = "全ての投稿を表示しています"
      return Submission.all
    end
  end
end
