class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:order_id].nil? 
      order = Order.find(session[:order_id])
      if order.complete?
        Order.new(user: current_user)
      else
        order
      end
    else
      Order.new(user: current_user)
    end
  end
end
