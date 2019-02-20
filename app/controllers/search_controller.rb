class SearchController < ApplicationController
  def index
    @stories = Story.search(params[:name])
  end
end
