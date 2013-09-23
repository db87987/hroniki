module OldsHelper
  
  def issue_title(issue_id)
    Issue.find(issue_id).title
  end
end
