class Order < ApplicationRecord
  has_many :order_items
  before_create :set_order_status
  before_save :update_total
  belongs_to :user

  enum status: { empty: 0, incomplete: 1, complete: 2}

  def total
    order_items.collect { |order_item| order_item.valid? ? (order_item.quantity * order_item.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.status = 1
  end

  def update_total
    self[:total] = total
  end
  
end
