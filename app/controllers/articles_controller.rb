class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end
  
  private

  def article_params
    params.require(:article).permit(:title,:text,:genre_id)
  end
end
