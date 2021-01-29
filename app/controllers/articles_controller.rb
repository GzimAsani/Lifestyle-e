class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy edit update]
  before_action :require_user, only: [:new]
  before_action :require_same_user, only: %i[destroy edit update]

  def show
    @article = Article.includes(:image_attachment, :user).find_by(id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was created successfully.'
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

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :image, category_ids: [])
  end

  def require_same_user
    return unless current_user != @article.user

    flash[:alert] = 'You can delete  only your own articles!'
    redirect_to @article
  end
end
