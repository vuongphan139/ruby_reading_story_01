class StaticPagesController < ApplicationController
  def home
    @stories = Story.newest.limit Settings.chapters_newest_limit
  end
end
