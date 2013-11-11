# == Schema Information
#
# Table name: other_jobs
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  company        :string(255)
#  position       :string(255)
#  start_date     :date
#  end_date       :date
#  description    :string(255)
#  monthly_income :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class OtherJob < ActiveRecord::Base
  attr_accessible :company, :description, :end_date, :monthly_income, :position, :start_date
  
  belongs_to :participant
  
  validates :company, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :position, presence: true
  validates :monthly_income, presence: true
  
end
