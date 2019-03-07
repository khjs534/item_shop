class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.save
      flash[:notice] = "Item added to cart"
      session[:order_id] = @order.id
      redirect_to "/"
    else
      flash[:alert] = "The Item could not be added to cart"
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items

    redirect_to '/cart'
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items

    redirect_to '/cart'
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
end
