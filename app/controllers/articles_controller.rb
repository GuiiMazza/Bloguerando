class ArticlesController < ApplicationController
 before_action :authenticate_user!, only: [:new, :edit, :destroy]
 #before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @article = current_user.articles.new
  end

  def create
    if @article = current_user.articles.create(article_params)
       redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
      @article = Article.all
  end

  def update
    @article = Article.find(params[:id])
    redirect_to @artcile, alert: 'Não foi possivel atualizar!!' && return unless @article.user == current_user

    if @article.update(article_params)
      redirect_to @article, notice: 'Foi atualizado'
    else
      flash[:alert] ='não foi possivel atualizar!!'
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
     if current_user.id == @article.user_id
        @article.destroy
        redirect_to articles_path
        else
          redirect_to articles_path
      end
  end

  def edit
      @article = Article.find(params[:id])
  end

  #def correct_user
    #@article = Article.find(params[:id])
    #redirect_to articles_path unless current_user?(@article.user)
  #end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end