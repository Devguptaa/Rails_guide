class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :valid , only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user=current_user

    if @comment.save
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      render 'articles/show'
    end
  end
  # def new_reply
  #   @parent_comment = Comment.find(params[:parent_comment_id])
  #   @article = @parent_comment.article
  # end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body,:user_id, :status, :parent_id)
    end

    def valid
      @comment=Comment.find(params[:id])

      if @comment.user_id==current_user.id

      else
        redirect_to articles_path, alert: "Not Authorized to Destroy this Comment"
      end
    end
end
