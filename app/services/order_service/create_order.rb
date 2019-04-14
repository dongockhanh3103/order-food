module OrderService
  class CreateOrder
    def initialize(params)
      @params = params
    end

    def execute
      user = UserService::CreateUser.new(@params).execute
      voucher = Voucher.find_by(code: @params[:code])
      if user.persisted?
        Order.create(
          state: "READY",
          user_id: user.id,
          voucher_id: voucher.id,
          total: @params[:total].to_f
        )
      end
    end
  end
end