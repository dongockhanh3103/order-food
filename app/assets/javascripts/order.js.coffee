# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', () ->
  return if $("#order__products").length is 0

  $voucherCode = $("#voucherCode")
  $couponMessage = $(".coupon-message")
  CHECK_VOUCHER_VALID_PATH = "/order/check_coupon"
  CREATE_ORDER_PATH = "/order/"
  $firstName = $("#firstName")
  $lastName = $("#lastName")
  $address = $("#address")
  $total = $("#total").text()

  $("#submitVoucher").click ->
    data = "code=#{$voucherCode.val()}"
    Rails.ajax({
      type: "POST", 
      url: CHECK_VOUCHER_VALID_PATH,
      data,
      success: (repsonse) ->
        exist = repsonse.exist
        message = repsonse.message
        $couponMessage.text(message)
        $couponMessage.removeClass('hidden')
        if (exist)
          debugger
          $couponMessage.removeClass('text-danger')
          $couponMessage.addClass('text-success')
          total = repsonse.total
          $("#total").text(total)

        else
          $couponMessage.addClass('text-danger')
          $couponMessage.removeClass('text-success')
      ,
      error: (error) ->
        console.log(error)
    })
  
  $("#payment").click ->
    data = "first_name=#{$firstName.val()}&last_name=#{$lastName.val()}&address=#{$address.val()}&total=#{$total}&code=#{$voucherCode.val()}"
    Rails.ajax({
    type: "POST", 
    url: CREATE_ORDER_PATH,
    data,
    success: (repsonse) ->
     console.log(repsonse)
    ,
    error: (error) ->
      console.log(error)
  })
)