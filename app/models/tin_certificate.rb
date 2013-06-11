# == Schema Information
#
# Table name: tin_certificates
#
#  id                    :integer          not null, primary key
#  tin                   :string(255)
#  status                :integer          default(0)
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  participant_id        :integer
#

class TinCertificate < ActiveRecord::Base
  attr_accessible :doc_file, :tin
  
  belongs_to :participant
  
  validates :tin, presence: true
  
  
  has_attached_file :doc_file, :styles => { :medium => "300x600>", :thumb => "100x200>" }, :default_url => "http://placehold.it/100x200"
  
end
