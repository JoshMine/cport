# == Schema Information
#
# Table name: passports
#
#  id                    :integer          not null, primary key
#  participant_id        :integer
#  series                :integer
#  number                :integer
#  issuer                :string(255)
#  dep_code              :string(255)
#  issue_date            :date
#  last_name             :string(255)
#  first_name            :string(255)
#  middle_name           :string(255)
#  gender                :string(255)
#  birth_date            :date
#  birth_place           :string(255)
#  marrital_status       :string(255)
#  official_address      :string(255)
#  doc_file_file_name    :string(255)
#  doc_file_content_type :string(255)
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Passport < ActiveRecord::Base
  attr_accessible :birth_date, :birth_place, :dep_code, :first_name, :gender, :issue_date, :issuer, :last_name, :middle_name, :number, :series, :marrital_status, :official_address, :doc_file
  
  belongs_to :participant
  
  validates :series, presence: true
  validates :number, presence: true
  validates :issuer, presence: true
  validates :issue_date, presence: true
  validates :dep_code, presence: true
  
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 1 }

  validates :official_address, presence: true
  validates :birth_place, presence: true
  
  validates :marrital_status, inclusion: {in: %w(single married unmarried widower)}, allow_blank: false
  
  has_attached_file :doc_file, :styles => { :medium => "300x600>", :thumb => "100x200>" }, :default_url => "http://placehold.it/100x200"
  
  def full_number
    "#{series} #{number}"
  end
end
