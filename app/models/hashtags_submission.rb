class HashtagsSubmission < ApplicationRecord
  belongs_to :hashtag
  belongs_to :submission

  def self.search(search)

    if search
      submissions_first = []
      words = search.split(/[[:blank:]]+/)
      words.each do |word|
        if word != ""
          $global_hashtags.push(word)
        end
      end

      if $global_hashtags == []
        $notice = "全ての投稿を表示しています"
        return Submission.all
      end

      $global_hashtags = $global_hashtags.uniq
      $global_hashtags.each do |word|
        if word != ""
          hashtag = Hashtag.find_by("name like ? ", "%#{word}%")
        end
        if hashtag && submissions_first == []
          submissions_first.push(hashtag.submissions)

        elsif hashtag
          submissions_second = []
          submissions_second.push(hashtag.submissions)
          submissions_first = submissions_second.flatten & submissions_first.flatten
        end

      end
      $notice = "#{submissions_first.flatten.length}件検索結果を表示しています"
      return submissions_first.flatten
    else
      $notice = "全ての投稿を表示しています"
      return Submission.all
    end
  end

end
