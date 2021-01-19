class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :require_user, only: [:new]

  def show
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end