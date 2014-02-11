class SearchController < ApplicationController
  def search
  end

  def results
    @search = params[:search]  
    params[:search] ? @results = ThinkingSphinx.search(params[:search], :limit => 1000) : @results = nil
  end
  
end
