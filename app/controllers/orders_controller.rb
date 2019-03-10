class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  def show
  end

  def update
    # Order is complete
    @order.status = 2
    if @order.save
      flash[:notice] = "Your order is complete"
      redirect_to '/'
    else
      flash[:alert] = "We could not complete your order. Please try again later"
      redirect_to '/cart'
    end
  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

end
