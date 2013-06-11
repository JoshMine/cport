# == Schema Information
#
# Table name: oversea_passports
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  series                :integer
#  number                :integer
#  issuer                :string(255)
#  issue_date            :date
#  exp_date              :date
#  last_name             :string(255)
#  first_name            :string(255)
#  status                :integer
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class OverseaPassport < ActiveRecord::Base
  attr_accessible :doc_file, :exp_date, :first_name, :issue_date, :issuer, :last_name, :number, :series
  
  belongs_to :participant
  
  validates :series, presence: true
  validates :number, presence: true
  validates :issuer, presence: true
  validates :issue_date, presence: true
  validates :exp_date, presence: true
  
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }
  
  has_attached_file :doc_file, :styles => { :medium => "300x600>", :thumb => "100x200>" }, :default_url => "http://placehold.it/100x200"
  
  def full_number
    "#{series} #{number}"
  end
  
end
