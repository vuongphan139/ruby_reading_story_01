class ChaptersController < ApplicationController
  before_action :find_chapter, only: %i(show edit update)
  before_action :find_story, only: %i(new create)

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

  def show; end

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
