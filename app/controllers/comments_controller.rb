class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.new(comment_params.merge(user: current_user))

     if @comment.save
      redirect_to article_path(@article)
    else
      render "comments/new"
    end
  end

  def destroy
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  def edit
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

     if @comment.update(comment_params)
      redirect_to @article
    else
      redirect_to 'edit'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
