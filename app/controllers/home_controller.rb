class HomeController < ApplicationController
  def index
    @submissions = Submission.all
  end
end
