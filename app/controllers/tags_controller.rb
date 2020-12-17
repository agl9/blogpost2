class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]
  
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Tag has been deleted"
    redirect_to tags_path
  end

  private

  def require_login
    unless logged_in?
      flash.notice = "Please log in to proceed"
      redirect_to tags_path
    end
  end
end
