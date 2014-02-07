class SearchController < ApplicationController
  def search
  end

  def results
    @search = params[:search]  
    @results = ThinkingSphinx.search(params[:search])
  end
  
end
