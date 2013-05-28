# == Schema Information
#
# Table name: portfolios
#
#  id         :integer          not null, primary key
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  confirm    :boolean
#

class Portfolio < ActiveRecord::Base
  attr_accessible :active, :confirm 
  
  #validates :user_id, presence: true
  validates :confirm, presence: true
  
  belongs_to :user
  has_many :participants
  
  def participant
    self.participants.first
  end
  
end
