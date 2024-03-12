class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :valid , only: [:edit,:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

    def valid
      @comment=Comment.find(params[:id])
      art=Article.where(id:@comment.article_id).user_id
      if art==current_user

      else
        redirect_to articles_path, alert: "Not Authorized to Edit this "
      end
    end
end
