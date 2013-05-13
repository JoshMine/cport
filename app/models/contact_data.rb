class ContactData < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :email, :f_address, :h_phone, :m_phone
  
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }
  
  belongs_to :person
  
  def full_name
     
  end
end
