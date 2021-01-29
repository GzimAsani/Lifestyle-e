module ApplicationHelper
  def vote_devote(article)
    vote = Vote.find_by(user_id: current_user.id, article_id: article.id)
    if vote
      button_to 'Dislike', { controller: 'votes', action: 'destroy', id: vote.id, article_id: article.id },
                method: :delete, class: 'btn btn-danger'
    else
      button_to 'Like', { controller: 'votes', action: 'create', article_id: article.id }, method: :post,
                                                                                           class: 'btn btn-primary'
    end
  end

  def vote_count(article)
    article.votes.count
  end
end
