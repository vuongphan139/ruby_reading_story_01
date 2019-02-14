class StaticPagesController < ApplicationController
  def home
    @stories = Story.newest.limit Settings.chapters_newest_limit
  end

  def manager
    @stories = current_user.stories.page(params[:page])
                           .per Settings.stories_manager_page
  end
end
