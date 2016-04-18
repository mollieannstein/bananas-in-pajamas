class CategoriesController < ApplicationController
  # before_filter :admin, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def create
  end
end
