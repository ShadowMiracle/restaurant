class OrderController < ApplicationController
  def update
    @order = current_order
    order_params[:shipping] = 20000
    if order_params[:coupon_code] == "CODERSCHOOL"
      order_params[:total] = @order[:subtotal]/2 + order_params[:shipping]
    else
      order_params[:total] = @order[:subtotal] + order_params[:shipping]
    end
    @order.update_attributes(order_params)
    byebug
  end

  private
    def order_params
      @order_params ||= params.require(:order).permit(:order_name, :order_phone_number, :order_address, :coupon_code)
    end
end
