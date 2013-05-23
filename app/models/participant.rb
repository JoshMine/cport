class Participant < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :date_birth, :gender, :f_address, :h_phone, :m_phone
  
  has_one :contact_data
  has_many :passports
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
  
  
end
