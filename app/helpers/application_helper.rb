module ApplicationHelper
  def all_articles
    @art = Article.all
  end

  def vote_devote(article, cat)
    vote = Vote.find_by(user_id: current_user.id, article_id: article.id)
    if vote
      button_to 'Dislike',
                { controller: 'votes', action: 'destroy', id: vote.id, article_id: article.id, category_id: cat.id },
                method: :delete, class: 'btn btn-danger'
    else
      button_to 'Like', { controller: 'votes', action: 'create', article_id: article.id, category_id: cat.id },
                method: :post, class: 'btn btn-primary'
    end
  end

  def vote_devote2(article)
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
