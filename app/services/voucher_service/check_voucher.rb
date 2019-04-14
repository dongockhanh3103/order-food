module VoucherService
  class CheckVoucher
    def initialize(code)
      @code = code
    end

    def execute
      voucher = Voucher.valid.where(code: @code)

      return { exist: true, message: 'valid' } if voucher.present?

      { exist: false, message: 'Invalid' }
    end
  end
end
