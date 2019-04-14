module PaymentService
  class CaculatorFeeTax
    def initialize(products, code = nil)
      @products = products
      @code     = code
    end

    def execute
      total = 0

      @products.each do |product|
        total += product['price'].to_f * product['quantity'].to_i
      end

      if @code.present?
        voucher = Voucher.find_by(code: @code)

        if voucher.is_fixed
          total -= voucher.discount_amount
        else
          total -= total * (voucher.discount_amount / 100.0)
        end
      end
      total
    end
  end
end
