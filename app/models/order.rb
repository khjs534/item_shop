class Order < ApplicationRecord
  has_many :order_items
  before_create :set_order_status
  before_save :update_total

  enum status: { empty: 0, incomplete: 1, complete: 2}

  def total
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.status = 1
  end

  def update_total
    self[:total] = total
  end
  
end
