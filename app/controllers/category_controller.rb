class CategoryController < ApplicationController
  def show
    @products = Category.find(params[:id]).product
  end
end
