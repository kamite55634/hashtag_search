class HashtagsSubmission < ApplicationRecord
  belongs_to :hashtag
  belongs_to :submission

  def self.search(search)
    if search
      submissions_first = []
      words = search.split(/[[:blank:]]+/)
      words.each do |word|
        $global_hashtags.push(word)
      end
      $global_hashtags.each do |word|
        hashtag = Hashtag.find_by("name like ? ", "%#{word}%")
        if hashtag && submissions_first == []
          submissions_first.push(hashtag.submissions)

        elsif hashtag
          submissions_second = []
          submissions_second.push(hashtag.submissions)
          submissions_first = submissions_second.flatten & submissions_first.flatten
        end

      end
      $notice = "#{$global_hashtags}の検索結果を表示しています"
      return submissions_first.flatten
    else
      $global_hashtags = nil
      $notice = "全ての投稿を表示しています"
      return Submission.all
    end
  end

end
