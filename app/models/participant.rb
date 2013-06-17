# == Schema Information
#
# Table name: participants
#
#  id           :integer          not null, primary key
#  last_name    :string(255)
#  first_name   :string(255)
#  middle_name  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :integer
#  gender       :string(255)
#  date_birth   :date
#  m_phone      :string(255)
#  h_phone      :string(255)
#  f_address    :string(255)
#  rating       :integer
#  index        :integer
#

class Participant < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :date_birth, :gender, :f_address, :h_phone, :m_phone
  
  #has_one :contact_data
  has_many :passports
  has_many :drive_licenses
  has_one  :pension_certificate
  has_one  :tin_certificate
  has_one  :oms_certificate
  has_many :oversea_passports
  has_many :flats
  has_many :cars
  has_many :main_jobs
  
  belongs_to :portfolio
  
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }
  
  validates :gender, inclusion: {in: %w(male female)}, allow_blank: false
  
  validates :date_birth, presence: true
  
  validates :m_phone, presence: true
  
  
  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
  
  def age
    ((Date.today - date_birth) / 365).floor
  end
  
  # ВРЕМЕННАЯ ЗАГЛУШКА!!!
  
  def driver_license
    ""
  end
  
  
end
