# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Hashtag.create([{ name: 'ヘアカラー' }, { name: '外国人風' }, { name: '新宿' }, { name: '渋谷' }, { name: 'ショートヘアー' }])

# 20.times do
#   Submission.create(text: "テストです。テストです。テストです。テストです。")
# end

20.times do
  HashtagsSubmission.create(hashtag_id: rand(1..5), submission_id: rand(1..20))
end