class Item < ApplicationRecord

  validates_presence_of :name, :description, :price

  validates_length_of :title, maximum: 250
  validates_length_of :description, maximum: 1000

  validates_numericality_of :price
end
