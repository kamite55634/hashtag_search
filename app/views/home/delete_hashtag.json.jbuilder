json.array! @submissions do |submission|
  # meal.nameがjsonデータのnameに代入されます
  # json.〇〇の〇〇がデータから値を取り出す時に使う変数名となります
  json.text submission.text
  json.created_at submission.created_at
  json.hashtags submission.hashtags_submissions do |group|
    json.hashtag group.hashtag.name
  end
end