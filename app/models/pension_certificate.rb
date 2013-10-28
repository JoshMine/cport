# == Schema Information
#
# Table name: pension_certificates
#
#  id                    :integer          not null, primary key
#  snils                 :string(255)
#  status                :integer          default(0)
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  participant_id        :integer
#

class PensionCertificate < ActiveRecord::Base
  attr_accessible :doc_file, :snils
  
  belongs_to :participant
  
  validates :snils, presence: true
  
  
  has_attached_file :doc_file, :styles => { :medium => "300x600>", :thumb => "100x100>" }, :default_url => "http://placehold.it/100x100"
end
