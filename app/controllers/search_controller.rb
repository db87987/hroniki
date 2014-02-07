class SearchController < ApplicationController
  def search
  end

  def results
    @search = params[:search]  
    @results = ThinkingSphinx.search(params[:search], :limit => 1000)
  end
  
end
