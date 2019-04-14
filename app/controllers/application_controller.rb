class ApplicationController < ActionController::Base
  before_action :get_categories

  def index
    session[:cart] = [] unless session[:cart].present?
    get_categories
  end

  def get_categories
    @categories = Category.where(active: true)
  end
end
