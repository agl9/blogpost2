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

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Woohoo! '#{@article.title}' entry created!"
      redirect_to article_path(@article)
    else 
      flash.notice = "Please fix the errors"
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Woohoo! '#{@article.title}' entry edited!"
      redirect_to article_path(@article)
    else 
      flash.notice = "Please fix the errors"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Place has been deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

end
