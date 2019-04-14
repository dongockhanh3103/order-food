module UserService
  class CreateUser
    def initialize(params)
      @params = params
    end

    def execute
      user = User.create(
        first_name: @params[:first_name],
        last_name: @params[:last_name],
        address: @params[:address]
      )

      user
    end
  end
end