class StoriesController < ApplicationController
  before_action :load_story, only: %i(show edit update)

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.build story_params

    if @story.save
      flash[:success] = t "add_story_successful"
      redirect_to @story
    else
      flash.now[:danger] = t "add_story_failure"
    end
  end

  def show; end

  def edit; end

  def update
    if @story.update story_params
      flash[:success] = t "story_update_successful"
      redirect_to @story
    else
      flash.now[:danger] = t "story_update_failure"
      render :edit
    end
  end

  private

  def story_params
    params.require(:story).permit :name, :author_name,
      :description, :cover_image,
      :progress, category_ids: []
  end

  def load_story
    @story = Story.find_by id: params[:id]
    return if @story
    flash[:danger] = "Story not found."
    redirect_to root_path
  end
end
