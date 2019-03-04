class StaticPagesController < ApplicationController
  def home
    @stories = Story.newest.limit Settings.chapters_newest_limit
    @stories_most_likes = Story.most_likes
                               .limit Settings.stories_most_likes_limit
  end

  def manager
    @stories = current_user.stories.page(params[:page])
                           .per Settings.stories_manager_page
  end
end
