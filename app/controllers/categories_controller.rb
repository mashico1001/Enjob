class CategoriesController < ApplicationController
  def index

  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
