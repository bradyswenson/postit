class CategoriesController < ApplicationController

  def index; end

  def show 
    @category = Category.find(params[:id])
    @posts = Category.find(params[:id]).posts
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "New category created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end