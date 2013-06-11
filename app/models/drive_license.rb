# == Schema Information
#
# Table name: drive_licenses
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  series                :string(255)
#  number                :integer
#  issuer                :string(255)
#  issue_date            :date
#  exp_date              :date
#  status                :integer          default(0)
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class DriveLicense < ActiveRecord::Base
  attr_accessible :exp_date, :issue_date, :issuer, :number, :series, :doc_file
  
  belongs_to :participant
  
  validates :series, presence: true
  validates :number, presence: true
  validates :issuer, presence: true
  validates :issue_date, presence: true
  validates :exp_date, presence: true
 
  
  has_attached_file :doc_file, :styles => { :medium => "300x600>", :thumb => "100x200>" }, :default_url => "http://placehold.it/100x100"
  
  def full_number
    "#{series} #{number}"
  end
end
