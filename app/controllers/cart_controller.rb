class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
    @cur_order = current_order
  end
end
