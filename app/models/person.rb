# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  portfolio_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contact_data_id :integer
#  first_name      :string(255)
#  middle_name     :string(255)
#  last_name       :string(255)
#

class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name
  
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }
  
  belongs_to :portfolio
  belongs_to :user
  has_one    :contact_data
  
end
