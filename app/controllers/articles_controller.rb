class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save 
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end
  def article_params
    params.require(:article).permit(:title, :text, :comment)
  end
end
