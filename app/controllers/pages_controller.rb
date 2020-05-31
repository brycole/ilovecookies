class PagesController < ApplicationController
  def index
    @categories = Category.where(category_id: nil)
  end
end
