class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @story = Story.find_by id: params[:story_id]
    @like = current_user.interactives.build story_id: @story.id,
                                            interactive_type: :like

    if @like.save
      @story.update liked: @story.liked + 1
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to @story
    end
  end

  def destroy
    @story = Story.find_by id: params[:id]
    @interactive = Interactive.find_by story_id: @story.id,
                                       user_id: current_user.id,
                                       interactive_type: :like
    if @interactive.destroy
      @story.update liked: @story.liked - 1
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to @story
    end
  end
end
