class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      @author = Author.find(current_user.id)
      redirect_back_or_to(articles_path,notice: "Logged in as #{@author.username} successfully")
    else
      flash.now.alert = 'Login failed'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_back_or_to(articles_path,notice: "Logged out")
  end

end
