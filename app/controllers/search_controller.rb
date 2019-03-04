class SearchController < ApplicationController
  def index
    @stories = Story.search(params[:name])
    render "result_search", layout: false
  end
end
