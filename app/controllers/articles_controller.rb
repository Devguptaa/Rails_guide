class ArticlesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
  # before_action :validdd, only: [:show]
  load_and_authorize_resource

  # before_action :authenticate_user!
  # before_action :vali , only: [:edit,:destroy]

  def index
    # @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # authorize! :read,@article
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article deleted successfully' }
      format.json { render json: { status: 'success', message: 'Article deleted successfully' } }
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
    def vali


      @article = Article.find(params[:id])
    if @article.user_id == current_user.id
      # User is authorized to edit the article
    else
      redirect_to articles_path, alert: "Not Authorized to Edit this "
    end
  end
end
