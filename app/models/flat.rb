# == Schema Information
#
# Table name: flats
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  address        :string(255)
#  rooms_quantity :integer
#  total_square   :float
#  living_square  :float
#  floor          :integer
#  price          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

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
