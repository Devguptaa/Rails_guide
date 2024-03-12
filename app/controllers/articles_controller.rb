class ArticlesController < ApplicationController
  before_action :authenticate_user!

  before_action :authenticate_user!, except: [:index, :show]
  before_action :vali , only: [:edit,:destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
    debugger
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
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
