module StoriesHelper
  def progress_select_value_helper
    [[I18n.t("writing"), 0], [I18n.t("done"), 1]]
  end

  def story_progress story
    story.progress == Settings.story_progress_done ? "done" : "writing"
  end
end
