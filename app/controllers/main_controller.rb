class MainController < ApplicationController

  def index
    @articles = Article.search(params[:terms])
  end
end
