class ProductController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    session[:cart].push({ id: params[:id],
                          name: params[:name],
                          quantity: params[:quantity],
                          price: params[:price] })

    size = session[:cart].length
    @result = { success: true, message: 'Add success', cart_size: size }
  end
end
