class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]
  before_action :require_user, only: [:new]
  before_action :require_same_user, only: [:destroy]

  def show
    @article = Article.includes(:image_attachment, :user).find_by(id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description, :image, category_ids: []))
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
    flash[:notice] = "You have successfuly delete article with id of #{@article.id}"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user 
      flash[:alert] = "You can delete  only your own articles!"
      redirect_to @article
    end
  end


end