module StoriesHelper
  def progress_select_value_helper
    [[I18n.t("writing"), 0], [I18n.t("done"), 1]]
  end
end
