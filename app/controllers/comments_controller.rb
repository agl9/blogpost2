class CommentsController < ApplicationController
  before_action :require_login, except: [:create]
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:author_name,:body)
  end

  def require_login
    unless logged_in?
      flash.notice = "Please log in to proceed"
      redirect_to article_path(@article)
    end
  end
end
