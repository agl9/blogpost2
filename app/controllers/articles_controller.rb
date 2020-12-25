class ArticlesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_auth, only: [:edit,:destroy]
  
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
    @author = Author.find(current_user.id)
    @article = @author.articles.new(article_params)
    if @article.save
      @article.author_id = current_user.id
      flash.notice = "Woohoo! '#{@article.title}' entry created!"
      redirect_to article_path(@article)
    else 
      flash.notice = "Please fix the errors"
      render 'new'
    end
  end

  def update
    @author = Author.find(current_user.id)
    @article = @author.articles.new(article_params)
    if @article.update(article_params)
      @article.author_id = @author.id
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
    params.require(:article).permit(:title, :body, :tag_list)
  end

  def require_login
    unless logged_in?
      flash.notice = "Please log in to proceed"
      redirect_to articles_path
    end
  end

  def require_auth
    @article = Article.find(params[:id])
    unless current_user.id == @article.author_id
      flash.notice = 'You are not authorized for this action'
      redirect_to article_path(@article)
    end
  end

end
