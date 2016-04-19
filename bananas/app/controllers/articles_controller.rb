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
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
  end

  def update
    p "________________________START HERE___________________________"
    p params
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
    @article.update article_params
    if @article.save
      @category.articles << @article
      flash[:notice] = "Article successfully created!!! GO BANANAS!!!"
      redirect_to "/categories/#{@category.id}"
    else
      @errors = @article.errors.full_messages
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    redirect_to '/login' unless is_admin?
    @article.find(params[:id])
    @article.delete
    redirect_to '/'
  end


private
  def article_params
    params.require(:article).permit(:title, :content, categories_attributes: [:name, :id])
  end
end
