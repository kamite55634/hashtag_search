class HomeController < ApplicationController
  def index
    if $global_hashtags == nil
      $global_hashtags = []
    end
    @submissions = HashtagsSubmission.search(params[:search])
  end

  def delete_hashtag
    $global_hashtags.delete(params[:hashtag])
    @submissions = HashtagsSubmission.search("")
    respond_to do |format|
      format.html {render :index}
      format.json {render :hashtag}
    end
  end

  def search
    if $global_hashtags == nil
      $global_hashtags = []
    end
    @submissions = HashtagsSubmission.search(params[:text])
    respond_to do |format|
      format.json {render :hashtag}
    end
  end
end
