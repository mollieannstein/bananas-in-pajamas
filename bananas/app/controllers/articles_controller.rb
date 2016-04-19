class ArticlesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def new
  end

  def create
  end

  def show
    @article = Article.find(params[:id])
  end
end

