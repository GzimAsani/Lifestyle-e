class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.order(created_at: :desc)
  end

end