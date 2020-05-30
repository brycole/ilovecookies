class PagesController < ApplicationController
  def index
    @categories = Category.where(category_id: nil, visible_homepage: true)
  end
end
