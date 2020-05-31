class CategoriesController < ApplicationController
  #skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.where(category_id: nil)
  end

  def show
    @category = Category.find(params[:id])
  end
end
