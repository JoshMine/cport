class OtherJob < ActiveRecord::Base
  attr_accessible :company, :description, :end_date, :monthly_income, :position, :start_date
  
  belongs_to :participant
  
  validates :company, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :position, presence: true
  validates :monthly_income, presence: true
  
end
