class AttachmentsController < ApplicationController
  before_action :require_login
  
  def create
    @article = Article.find(params[:article_id])
    @attachment = @article.attachments.create(attachment_params)
    redirect_to article_path(@article)
  end

  private
  def attachment_params
    params.require(:attachment).permit(:image)
  end

  def require_login
    unless logged_in?
      flash.notice = "Please log in to proceed"
      redirect_to article_path(@article)
    end
  end

end
