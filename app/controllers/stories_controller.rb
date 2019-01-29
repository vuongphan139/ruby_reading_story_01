class StoriesController < ApplicationController
  before_action :load_story, only: %i(show edit update destroy)

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

  def destroy
    if @story.destroy
      flash[:success] = t "story_deleted_successful"
      redirect_to root_path
    else
      flash.new[:danger] = t "story_delete_failed"
      render :show
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
    flash[:danger] = t "story_not_found"
    redirect_to root_path
  end
end
