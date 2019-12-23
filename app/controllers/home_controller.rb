class HomeController < ApplicationController
  def index
    if $global_hashtags == nil
      $global_hashtags = []
    end
    @submissions = HashtagsSubmission.search(params[:search])
  end
end
