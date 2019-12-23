class RenameHahstagIdColumnToHashtagsSubmissions < ActiveRecord::Migration[6.0]
  def change
    rename_column :hashtags_submissions, :hahstag_id, :hashtag_id
  end
end
