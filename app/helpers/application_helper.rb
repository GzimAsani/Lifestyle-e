module ApplicationHelper
  def vote(article)
    article.votes.count.zero? ? 'Vote' : 'Votes'
  end
end