# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', () ->
  return if $("#category__product").length is 0

  $increaseQuantity = $(".product__btn-increase")
  $decreaseQuantity = $(".product__btn-decrease")
  $quantity         = $(".product__quantity")
  $addToCart        = $(".btn-add-to-cart")
  $productId        = $("#product_id").val()
  $productPrice     = $("#product_price").val()
  $productName      = $("#product_name").val()

  ADD_TO_CART_PATH  = "/product/#{$productId}/add_to_cart"

  $increaseQuantity.click ->
    quantityValue = $quantity.val();
    $quantity.val(++quantityValue);

  $decreaseQuantity.click ->
    quantityValue = $quantity.val();
    return if Number(quantityValue) is 0
    $quantity.val(--quantityValue);

  $addToCart.click ->
    data = "quantity=#{$quantity.val()}&price=#{$productPrice}&id=#{$productId}&name=#{$productName}"
    Rails.ajax({
      type: "POST", 
      url: ADD_TO_CART_PATH,
      data,
      success: (repsonse) ->
        $("#cart-size").text(repsonse.cartSize)
      ,
      error: (error) ->
        console.log(error)
    })
)

  
     


