class HomeController < ApplicationController
  def index
    @submissions = Submission.search(params[:search])
  end
end
