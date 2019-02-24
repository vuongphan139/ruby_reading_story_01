class ChaptersController < ApplicationController
  before_action :find_chapter, only: %i(show edit update destroy)
  before_action :find_story, only: %i(new create show)
  layout "show_chapter_layout", only: %i(show)

  def new
    @chapter = @story.chapters.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @chapter = @story.chapters.build chapter_params

    if @chapter.save
      flash.now[:success] = t "add_chapter_successful"
    else
      flash.now[:danger] = t "add_chapter_failure"
    end
    @chapters = @story.chapters
    respond_to do |format|
      format.html{redirect_to edit_story_path @chapter.story}
      format.js
    end
  end

  def show
    @chapters = @chapter.story.chapters.page(params[:page])
                                       .per Settings.story_progress_done
  end

  def edit
    @chapter = Chapter.find_by id: params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @chapter.update chapter_params
      flash.now[:success] = t "chapter_update_successful"
    else
      flash.now[:danger] = t "chapter_update_failure"
    end
    @chapters = @chapter.story.chapters
    respond_to do |format|
      format.html{redirect_to edit_story_path @chapter.story}
      format.js
    end
  end

  def destroy
    if @chapter.destroy
      flash[:success] = t "chapter_deleted_successful"
    else
      flash[:danger] = t "chapter_delete_failed"
    end
    redirect_to edit_story_path @chapter.story
  end

  private

  def chapter_params
    params.require(:chapter).permit :name, :image,
      :progress, :content
  end

  def find_chapter
    @chapter = Chapter.find_by id: params[:id]

    return if @chapter
    flash[:danger] = t "chapter_not_found"
    redirect_to root_path
  end

  def find_story
    @story = Story.find_by id: params[:story_id]
  end
end
