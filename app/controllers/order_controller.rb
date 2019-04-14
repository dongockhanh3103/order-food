class OrderController < ApplicationController

  def index
    @products = session[:cart]
    @total = PaymentService::CaculatorFeeTax.new(@products).execute
  end

  def check_coupon
    @result = VoucherService::CheckVoucher.new(params[:code]).execute

    products = session[:cart]
    if @result[:exist]
      total = PaymentService::CaculatorFeeTax.new(products, params[:code]).execute
      @result[:total] = total
    end

    @result
  end

  def create
    order = OrderService::CreateOrder.new(params).execute

    if order.persisted?
      @result = {success: true}
    else
      @result = {success: false}
    end
  end
end
