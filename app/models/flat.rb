class Flat < ActiveRecord::Base
  attr_accessible :address, :floor, :living_square, :price, :rooms_quantity, :total_square
  
  belongs_to :participant
  
  validates :address, presence: true
  validates :floor, presence: true
  validates :living_square, presence: true
  validates :price, presence: true
  validates :rooms_quantity, presence: true
  validates :total_square, presence: true
  
end
