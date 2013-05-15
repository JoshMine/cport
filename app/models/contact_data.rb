# == Schema Information
#
# Table name: contact_data
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  m_phone    :string(255)
#  h_phone    :string(255)
#  f_address  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactData < ActiveRecord::Base
  attr_accessible :email, :f_address, :h_phone, :m_phone
  
  belongs_to :person
  
  before_save { |contact_data| contact_data.email = email.downcase }
  

end
