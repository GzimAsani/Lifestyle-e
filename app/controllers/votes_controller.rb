class VotesController < ApplicationController
  before_action :find_article
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:alert] = 'You have already liked this article!'
    else
      flash[:notice] = 'You just liked this article!'
      @article.votes.create(user_id: current_user.id)
    end
    redirect_to articles_path
  end

    def destroy
      if !already_liked?
        flash[:alert] = 'Cannot unlike this article!'
      else
        flash[:alert] = 'YOu just unliked this article'
        @vote.destroy
      end
      redirect_to articles_path
    end
  



private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def already_liked?
    Vote.where(user_id: current_user.id, article_id:
    params[:article_id]).exists?
  end

  def find_like
    @vote = @article.votes.find(params[:id])
  end
end