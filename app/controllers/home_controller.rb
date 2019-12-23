class HomeController < ApplicationController
  def index
    @submissions = HashtagsSubmission.search(params[:search])
  end
end
