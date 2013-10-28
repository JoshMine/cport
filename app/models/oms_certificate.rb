# == Schema Information
#
# Table name: oms_certificates
#
#  id             :integer          not null, primary key
#  number         :string(255)
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  participant_id :integer
#

class OmsCertificate < ActiveRecord::Base
  attr_accessible :number
  
  belongs_to :participant
  
  validates :number, presence: true
    
  has_attached_file :doc_file, :styles => { :medium => "300x600>", :thumb => "100x200>" }, :default_url => "http://placehold.it/100x200"
end
