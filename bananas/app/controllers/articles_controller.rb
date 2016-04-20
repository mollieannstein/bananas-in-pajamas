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
        Tagging.create(article_id: @article.id, category_id: @category.id)
          @article.creator_id = session[:user_id]
          @article.categorie << @article
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
    p params
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def update
    p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @category = Category.find(params[:category_id])
    p params
    @article = Article.find(params[:id])
    category_ids = params[:article][:category_ids]
    category_ids.pop
    categories = []
    category_ids.each do |id|
      new_cat = Category.find_or_create_by(params[:name])
      categories << new_cat
    end
    taggings = []
    categories.each do |category|
      taggings << category.taggings.find_or_create_by(category_id: category.id, article_id: @article.id)
    end
    taggings.each do |tagging|
      # @article.taggings.clear
      @article.taggings << tagging
    end
      @article.update(article_params)
      if @article.save
      flash[:notice] = "Article successfully created!!! GO BANANAS!!!"
      redirect_to "/categories/#{@category.id}/articles/#{@article.id}"
    else
      @errors = @article.errors.full_messages
      render action: 'edit'
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
    params.require(:article).permit(:title, :content, categories_attributes: [:id, :name])
  end
end
