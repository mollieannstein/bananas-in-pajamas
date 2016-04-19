class ArticlesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @articles = Article.search(params[:terms])
  end

  def new
    @article = Article.new
    # @categories = Categories.all
  end

  def create
    if params[:article][:category][:name] != nil
       @category = Category.find_or_create_by(name: params[:article][:category][:name])
       @article = Article.new(article_params)
       if @article.save
          @article.creator_id = session[:user_id]
          @category.articles << @article
        redirect_to "/categories/#{@category.id}", notice: "The article has been successfully created."
      else
        @errors = @article.errors.full_messages
        render action: "new"
      end
    else
      @errors = ["Category name can't be blank!"]
      render action: "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

  end

  def show
    @article = Article.find(params[:id])
  end


private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
