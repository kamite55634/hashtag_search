class CreateHashtagsSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags_submissions do |t|
      t.integer :hahstag_id
      t.integer :submission_id

      t.timestamps
    end
  end
end
