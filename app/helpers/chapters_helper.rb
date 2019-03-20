module ChaptersHelper
  def name_story
    if @chapters&.page
      @chapters.first.story.name
    else
      @chapter.story.name
    end
  end

  def name_chapter
    if @chapters&.page
      @chapters.first.name
    else
      @chapter.name
    end
  end

  def content_chapter
    if @chapters&.page
      sanitize @chapters.first.content
    else
      sanitize @chapter.content
    end
  end
end
