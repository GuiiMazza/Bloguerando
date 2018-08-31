class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user: current_user))
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
